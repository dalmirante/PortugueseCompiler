type cst = None | Int of int | Bool of bool | Float of float

type op = Minus | Plus | Times | Div
type bop = And | Or | Beq | Leq | Bg | Ls

type expr = 
    Cst of cst
    | Ident of string
    | Op of op * expr * expr
    | Bop of bop * expr * expr

type stmt =
    Print of expr
    | Set of string * expr
    | Nop of unit
    | If of expr * seq
    | IfElse of expr * seq * seq

and seq = stmt list