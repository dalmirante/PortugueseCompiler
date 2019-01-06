open Ast
open Mips
open Typing

exception Compile_Error of string

let (variables: (string, unit) Hashtbl.t) = Hashtbl.create 17 
let contIfs = 0

(*let rec compile_if_expr = function
    Cst i -> compile_expr i
    | Ident id -> compile_expr id
    | Bop (o, e1, e2) ->
    begin
        let x = compile_if_expr e1 ++ sw t0 areg (4, sp) in
        let y = compile_if_expr e2 ++ lw t1 areg (4, sp) in
        let state = 
            match o with
                And -> x ++ y ++ _and t0 t0 t1 ++ bn
                | _ -> nop
    end*)


let rec expr_to_string = function
Cst i ->
    begin
    match i with
        Int i -> string_of_int i
        | Bool true -> "verdade"
        | _ -> "falso"
    end
| Ident i -> i
| Op (o, e1, e2) ->
    begin
    let x = expr_to_string e1 in
    let y = expr_to_string e2 in
        match o with
        Plus -> (x ^ "+" ^ y)
        | Minus -> (x ^ "-" ^ y)
        | Times -> (x ^ "*" ^ y)
        | Div -> (x ^ "/" ^ y)
    end
| Bop (o, e1, e2) ->
    begin
    let x = expr_to_string e1 in
    let y = expr_to_string e2 in
        match o with
        And -> (x ^ " AND " ^ y)
        | Or -> (x ^ " OR " ^ y)
        | Beq -> (x ^ ">=" ^ y)
        | Leq -> (x ^ "<=" ^ y)
        | Bg -> (x ^ ">" ^ y)
        | Ls -> (x ^ "<" ^ y)
    end

let rec compile_expr = function
    Cst i -> 
    begin
        match i with
             Int j -> li t0 j ++ li a0 j
             | Bool true -> li t0 1
             | _ -> li t0 0
    end
    | Ident i ->
        if Hashtbl.mem variables i then lw t0 alab i ++ lw a0 alab i else li a0 0
    | Op (o, e1, e2) ->
        let x = compile_expr e1 ++ sw t0 areg(4, sp) in
        let y = compile_expr e2 ++ lw t1 areg(4,sp)in 
        begin
        match o with
            Plus -> x ++ y ++ add a0 t0 oreg t1 
            | Minus -> x ++ y ++ sub a0 t0 oreg t1
            | Times -> x ++ y ++ mul a0 t0 oreg t1
            | Div -> x ++ y ++ div t1 t2 ++ mflo a0
        end
    | Bop (o, e1, e2) -> 
        let x = compile_expr e1 ++ sw t0 areg(4, sp) in
        let y = compile_expr e2 ++ move t1 t0 ++ lw t0 areg(4, sp) in
        match o with
            And -> x ++ y ++ and_ t0 t1 t0
            | Or -> x ++ y ++ or_ t0 t1 t0
            | Beq -> x ++ y ++ sge t0 t0 oreg t1
            | Leq -> x ++ y ++ sle t0 t0 oreg t1
            | Ls -> x ++ y ++ slt t0 t0 oreg t1 
            | Bg -> x ++ y ++ sgt t0 t0 oreg t1

let rec compile_stmt ctxType = function
    Print x -> 
    begin
        match type_expression ctxType x with
        Tint -> comment ( "Showing " ^ (expr_to_string x) )++ li v0 1 ++(compile_expr x) ++ syscall ++ la a0 alab "newline" ++ li v0 4 ++ syscall
        | Tbool -> comment ("Showing " ^ (expr_to_string x) ) ++ li v0 4 ++(compile_expr x) ++ jal "print"++ syscall ++ la a0 alab "newline" ++ li v0 4 ++ syscall
        | _ -> nop
    end

    |Set (id, ex) ->
        let value = compile_expr ex in
        let code = comment ("Storing " ^ id) ++ value ++ sw t0 alab id in
            Hashtbl.replace variables id ();
            code;
    | If (e1, s1) -> 
        let code = List.map (compile_stmt ctxType) s1 in
        let code = List.fold_right (++) code nop in
            compile_expr e1 ++ beq t0 zero "continue" ++ code ++ label "continue"
    | _ -> nop
                

let compile_prog p ctxType = 
    let code = List.map (compile_stmt ctxType) p in
    let code = List.fold_right (++) code nop in
    let program = {
        text =
            label "main" ++
            addiu sp sp oi (-8) ++
            code ++
            j alab "end"++
            label "print" ++
            move t4 ra ++
            bnez t0 "verdade" ++
            jal "prepare_return" ++
            label "verdade" ++
            jal "print_true" ++
            jr t4 ++
            label "print_true"++
            la a0 alab "true"++
            j alab "show"++
            label "print_false" ++
            la a0 alab "false" ++
            label "show" ++
            jr ra ++
            label "prepare_return" ++
            move t0 ra ++
            add t0 t0 oi 4 ++
            move ra t0 ++
            j alab "print_false" ++
            label "end"++
            addiu sp sp oi 8;
        data =
            Hashtbl.fold (fun x _ l -> label x ++ space 4 ++ l ) variables (label "true" ++ asciiz "verdade" ++ label "false" ++ asciiz "falso" ++ label "newline" ++ asciiz "\n")
    } in
    let fle = open_out "test.asm" in
    let fmt = Format.formatter_of_out_channel fle in
    Mips.print_program fmt program;
    Format.fprintf fmt "@?";
    close_out fle
