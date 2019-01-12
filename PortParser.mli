
(* The type of tokens. *)

type token = 
  | WHILE
  | TO
  | TIMES
  | THEN
  | TEST
  | SET
  | SEMICOLON
  | RRP
  | RP
  | RB
  | PRINT
  | PLUS
  | OR
  | MINUS
  | LRP
  | LP
  | LESS
  | LEQ
  | LB
  | IF
  | IDENT of (string)
  | FOR
  | EQ
  | EOF
  | ELSE
  | DONE
  | DO
  | DIV
  | CST of (Ast.cst)
  | COLON
  | BIG
  | BEQ
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val seq: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.seq)
