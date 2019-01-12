%{
    open Ast
%}

%token <Ast.cst> CST
%token <string> IDENT
%token PLUS MINUS TIMES DIV
%token AND OR BEQ BIG LEQ LESS
%token IF THEN ELSE SET PRINT TEST
%token WHILE DONE DO FOR TO
%token LP RP LRP RRP LB RB
%token EQ SEMICOLON COLON EOF

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

cst:
    c = csts   {List.rev c}
    ;

csts:
    c = CST     {[c]}
    | c1 = csts COLON c2 = CST {c2 :: c1}
    ;

expr: c = CST                           { Cst c }
      | i = IDENT                       { Ident i }
      | id = IDENT LRP c = CST RRP      { Arr(id, c) }
      | e1 = expr o = bop e2 = expr     { Bop(o, e1, e2) }
      | e1 = expr o = op e2 = expr      { Op(o, e1, e2) }
      ;


stmt: PRINT e = expr                                                    { Print e }
    | SET i = IDENT EQ e = expr                                         { Set(i, e) }
    | IF e = expr THEN LP s = stmts RP TEST                             { If(e, List.rev s) }
    | IF e = expr THEN LP s1 = stmts RP ELSE LP s2 = stmts RP TEST      { IfElse(e, List.rev s1, List.rev s2) }
    | WHILE e = expr DO LP s = stmts RP DONE                            { While (e,List.rev s) }
	| DO LP s = stmts  RP WHILE e = expr DONE							{ DoWhile (List.rev s,e) }
    | FOR i = IDENT TO e = expr DO LP s = stmts RP DONE                 { For(i, e, List.rev s) }
    | SET i = IDENT LRP c = CST RRP EQ LB c1 = cst RB                  { Arr(i, c, c1) }
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