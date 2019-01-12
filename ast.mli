type cst = None | Int of int | Bool of bool | Float of float

type op = Minus | Plus | Times | Div
type bop = And | Or | Beq | Leq | Bg | Ls

type expr = 
    Cst of cst
    | Ident of string
    | Op of op * expr * expr
    | Bop of bop * expr * expr
    | Arr of string * cst

type stmt =
    Print of expr
    | Set of string * expr
    | Nop of unit
    | If of expr * seq
    | IfElse of expr * seq * seq
    | While of expr * seq
	| DoWhile of seq * expr
    | For of string * expr * seq
    | Arr of string * cst * nmrArray

and seq = stmt list
and nmrArray = cst list