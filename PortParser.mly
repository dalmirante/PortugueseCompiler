%{
    open Ast
%}

%token <Ast.cst> CST
%token <string> IDENT
%token PLUS MINUS TIMES DIV
%token AND OR BEQ BIG LEQ LESS
%token IF THEN ELSE SET PRINT TEST
%token LP RP
%token EQ SEMICOLON EOF

(* As operações lógicas são feitas em último *)
%left AND OR BEQ BIG LEQ LESS
%left PLUS MINUS
%left TIMES DIV

%start seq

%type <Ast.seq> seq

%%

seq:
    | s = stmts EOF {List.rev s}
    ;

stmts: s = stmt                           { [s] }
    | s1 = stmts SEMICOLON s2 = stmt      { s2 :: s1 }
    ;

expr: c = CST                           { Cst c }
      | i = IDENT                       { Ident i }
      | e1 = expr o = bop e2 = expr     { Bop(o, e1, e2) }
      | e1 = expr o = op e2 = expr      { Op(o, e1, e2) }
      ;


stmt: PRINT e = expr                                        { Print e }
    | SET i = IDENT EQ e = expr                             { Set(i, e) }
    | IF e = expr THEN LP s = stmts RP TEST                        { If(e, List.rev s) }
    | IF e = expr THEN LP s1 = stmts RP ELSE LP s2 = stmts RP TEST { IfElse(e, List.rev s1, List.rev s2) }
    ;

%inline op:
    PLUS  {Plus}
    | MINUS {Minus}
    | DIV   {Div}
    | TIMES {Times}

%inline bop:
    AND     {And}
    | OR    {Or}
    | BEQ   {Beq}
    | BIG   {Bg}
    | LESS  {Ls}
    | LEQ   {Leq}