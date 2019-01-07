open Ast
open Mips
open Typing

exception Compile_Error of string

let (variables: (string, unit) Hashtbl.t) = Hashtbl.create 17 
let contIfs = ref 0

let rec expr_to_string = function
Cst i ->
    begin
    match i with
        Int i -> string_of_int i
        | Bool true -> "verdade"
        | Float f -> string_of_float f
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

let rec compile_expr ctxType = function
    Cst i -> 
    begin
        match i with
             Int j -> li t0 j ++ li a0 j
             | Bool true -> li t0 1 ++ li fp 1
             | Float f -> lif t0 (Int32.to_int (Int32.bits_of_float f)) ++ mtc1 t0 f12
             | _ -> li t0 0 ++ li fp 0
    end
    | Ident i ->
        if Hashtbl.mem variables i then lw t0 alab i ++ lw a0 alab i else li a0 0
    | Op (o, e1, e2) ->
        begin
            match type_expression ctxType e1 with
            Tint ->
                let x = compile_expr ctxType e1 ++ sw t0 areg(4, sp) in
                let y = compile_expr ctxType e2 ++ lw t1 areg(4,sp)in 
                begin
                    match o with
                            Plus -> x ++ y ++ add a0 t0 oreg t1 
                            | Minus -> x ++ y ++ sub a0 t1 oreg t0
                            | Times -> x ++ y ++ mul a0 t0 oreg t1
                            | Div -> x ++ y ++ div t1 t2 ++ mflo a0
                end
            | Tfloat -> 
                let x = compile_expr ctxType e1 ++ movs f0 f12 in
                let y = compile_expr ctxType e2 ++ movs f1 f12 in
                begin
                    match o with
                        Plus -> x ++ y ++ adds f12 f0 f1
                        | Minus -> x ++ y ++ subs f12 f0 f1
                        | Times -> x ++ y ++ muls f12 f0 f1
                        | Div -> x ++ y ++ divs f12 f0 f1
                end
            | _ -> nop
        end
    | Bop (o, e1, e2) -> 
        match type_expression ctxType e1 with
        | Tint ->
        begin
            let x = compile_expr ctxType e1 ++ sw t0 areg(4, sp) in
            let y = compile_expr ctxType e2 ++ move t1 t0 ++ lw t0 areg(4, sp) in
            match o with
                Beq -> x ++ y ++ sge fp t0 oreg t1
                | Leq -> x ++ y ++ sle fp t0 oreg t1
                | Ls -> x ++ y ++ slt fp t0 oreg t1 
                | Bg -> x ++ y ++ sgt fp t0 oreg t1
                | _ -> nop
        end
        | Tfloat ->
        begin
            let x = compile_expr ctxType e1 ++ movs f0 f12 in
            let y = compile_expr ctxType e2 ++ movs f1 f12 in
            match o with
                Beq -> x ++ y ++ cle f1 f0 ++ bc1f "set_false" ++ li fp 1 ++ jal "print" ++ j alab ("continue" ^ expr_to_string (Cst (Int !contIfs))) ++ label "set_false" ++ li fp 0
                | Leq -> x ++ y ++ cle f0 f1 ++ bc1f "set_false" ++ li fp 1 ++ jal "print" ++ j alab ("continue" ^ expr_to_string (Cst (Int !contIfs))) ++ label "set_false" ++ li fp 0
                | Ls -> x ++ y ++ clt f0 f1 ++ bc1f "set_false" ++ li fp 1 ++ jal "print" ++ j alab ("continue" ^ expr_to_string (Cst (Int !contIfs))) ++ label "set_false" ++ li fp 0
                | Bg -> x ++ y ++ cle f1 f0 ++ bc1f "set_false" ++ li fp 1 ++ jal "print" ++ j alab ("continue" ^ expr_to_string (Cst (Int !contIfs))) ++ label "set_false" ++ li fp 0
                | _ -> nop
        end
        | Tbool ->
        begin
            let x = compile_expr ctxType e1 ++ sw t0 areg(4, sp) in
            let y = compile_expr ctxType e2 ++ move t1 t0 ++ lw t0 areg(4, sp) in
            match o with
                And -> x ++ y ++ and_ fp t1 t0
                | Or -> x ++ y ++ or_ fp t1 t0
                | _ -> nop
        end
        | _ -> nop

let rec compile_stmt ctxType = function
    Print x -> 
    begin
        match type_expression ctxType x with
            Tint -> comment ( "Showing " ^ (expr_to_string x) )++ li v0 1 ++ (compile_expr ctxType x) ++ syscall ++ la a0 alab "newline" ++ li v0 4 ++ syscall
            | Tbool -> 
            contIfs := !contIfs +1;
                comment ("Showing " ^ (expr_to_string x) ) ++ li v0 4 ++ (compile_expr ctxType x) ++ jal "print" ++ label ("continue" ^ expr_to_string (Cst (Int !contIfs))) ++ syscall ++ la a0 alab "newline" ++ li v0 4 ++ syscall
            | Tfloat -> comment ("Showing " ^ (expr_to_string x) ) ++ li v0 2 ++ compile_expr ctxType x ++ jal "print" ++ syscall
            | _ -> nop
    end

    |Set (id, ex) ->
        let value = compile_expr ctxType ex in
        let code = comment ("Storing " ^ id) ++ value ++ sw t0 alab id in
            Hashtbl.replace variables id ();
            code;
    | If (e1, s1) -> 
    begin
        contIfs := !contIfs +1;
        let code = List.map (compile_stmt ctxType) s1 in
        let code = List.fold_right (++) code nop in
            comment ("Valor " ^ expr_to_string (Cst(Int !contIfs)) ^ " em If") ++ compile_expr ctxType e1 ++ beq fp zero ("continue" ^ expr_to_string (Cst(Int !contIfs))) ++ code ++ label ("continue" ^ expr_to_string (Cst(Int !contIfs)))
    end
    | IfElse (e, s1, s2) ->
        contIfs := !contIfs +1;
        let stmt1 = List.map (compile_stmt ctxType) s1 in
        let stmt1 = List.fold_right (++) stmt1 nop in
        let stmt2 = List.map (compile_stmt ctxType) s2 in
        let stmt2 = List.fold_right (++) stmt2 nop in
            comment ("Valor " ^ expr_to_string (Cst(Int !contIfs)) ^ " em IfElse") ++ compile_expr ctxType e ++ beq fp zero ("else" ^ expr_to_string (Cst(Int !contIfs))) ++ 
                stmt1 ++ j alab ("exit" ^ expr_to_string (Cst(Int !contIfs))) ++ 
                label ("else" ^ expr_to_string (Cst(Int !contIfs))) ++ 
                stmt2 ++ label ("exit" ^ expr_to_string (Cst(Int !contIfs)))
    | Nop _ -> nop
                

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
            bnez fp "verdade" ++
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
