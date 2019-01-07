
(* The type of tokens. *)

type token = 
  | TIMES
  | THEN
  | TEST
  | SET
  | SEMICOLON
  | RP
  | PRINT
  | PLUS
  | OR
  | MINUS
  | LP
  | LESS
  | LEQ
  | IF
  | IDENT of (string)
  | EQ
  | EOF
  | ELSE
  | DIV
  | CST of (Ast.cst)
  | BIG
  | BEQ
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val seq: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.seq)
