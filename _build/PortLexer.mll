{
    open Lexing
    open PortParser

    exception Lexing_error of string

    let kwd_tbl = ["se",IF; "entao",THEN; "senao",ELSE; "e",AND; "ou",OR; "def",SET; "mostra",PRINT;"testar",TEST; "verdade", CST (Bool true); "falso", CST (Bool false)]

    let id_or_kwd s =
        try List.assoc s kwd_tbl with _ -> IDENT s

    let newline lexbuf =
        let pos = lexbuf.lex_curr_p in
            lexbuf.lex_curr_p <- {pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum}
}

let letter = ['a' - 'z' 'A'- 'Z']
let digit = ['0'-'9']
let ident = letter (letter | digit | '_')*
let integer = digit+
let space = [' ' '\t']

rule token = parse
    | "\n" {newline lexbuf; token lexbuf}
    | "+" {PLUS}
    | "*" {TIMES}
    | ident as id { id_or_kwd id }
    | space+ {token lexbuf}
    | "-" {MINUS}
    | "/" {DIV}
    | "(" {LP}
    | ")" {RP}
    | "/*" {comment lexbuf}
    | "=" {EQ}
    | eof {EOF}
    | integer as i { CST (Int (int_of_string i) )}
    | ";" {SEMICOLON}
    | _ as c {raise (let x = (Printf.sprintf "%c" c) in (Lexing_error ("Valor " ^ x ^ " desconhecido")))}

and comment = parse
    |   "*/" {token lexbuf}
    |   _ {comment lexbuf}
    | eof {raise (Lexing_error "eof" )}