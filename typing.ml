open Ast

exception Type_Error of string

type types =
	 Tnone
	| Tint
	| Tbool
	| Tfloat

let analyse_cst = function
	| Int _ -> Tint
	| Bool _ -> Tbool
	| Float _ -> Tfloat
	| _ -> Tnone

let type_toString = function
	Tint -> "INT"
	| Tbool -> "BOOL"
	| Tfloat -> "FLOAT"
	| Tnone -> ""

let writeError a b =
	match (a, b) with
		(Tbool, Tbool) -> "Operação não é possível"
	    | (Tbool, _) -> "Esperava " ^ type_toString b ^ " mas foi dado " ^ type_toString a
		| (_, Tbool) -> "Esperava " ^ type_toString a ^ " mas foi dado " ^ type_toString b
		| (_ , Tfloat) | (_, Tint)| (Tfloat, _) | (Tint, _) -> "Esperava " ^ type_toString a ^ " mas foi dado " ^ type_toString b
		| _ -> ""

let rec type_expression ctx = function
	(* Aqui vou verificar as expressões binárias como verdade e falso e só aceito tipos iguais (Tbool com Tbool) *)
	Bop (o, e1, e2) -> 
	begin
		let typee1 = type_expression ctx e1 in
		let typee2 = type_expression ctx e2 in
		match o with
		Beq | Leq | Bg | Ls -> if (typee1 = Tint && typee1 = typee2) || (typee1 = Tfloat && typee1 = typee2) then Tbool else (raise (Type_Error (writeError typee1 typee2)))
		| _ -> if(typee1 = Tbool && typee2 = typee1) then typee1 else (raise (Type_Error (writeError typee1 typee2) ) )
	end
	(* Vou verificar se a variável foi previamente definida para ir buscar o tipo *)
	| Ident n -> 
			begin
				if not(Hashtbl.mem ctx n) then raise (Type_Error ("Variável " ^ n ^ " não encontrada."))
				else Hashtbl.find ctx n
			end
	(* Este aqui vai receber um (Int _ )ou (Bool _) e retorna o tipo associado (no caso Tint ou Tbool) *)
	| Cst i -> analyse_cst i
	(* Isto faz o mesmo que Bop mas só com inteiros *)
	| Op (o, e1, e2) ->
		let typee1 = type_expression ctx e1 in 
		let typee2 = type_expression ctx e2 in
		if( typee1 = Tint && typee2 = typee1) then typee1 
		else if (typee1 = Tfloat && typee2 = typee1) then typee1
		else (raise (Type_Error (writeError typee1 typee2)))

let rec stmt_type ctx = function
	(* As stmt não têm tipo, ou seja, não retornam nada. PRINT é to tipo UNIT, só tenhos de virificar o que está à frente*)
	Print e ->
		begin
			match type_expression ctx e with
			Tint -> ()
			| Tbool -> ()
			| Tfloat -> ()
			| _ -> raise (Type_Error "Esperava expressão.")
		end
	(* Aqui guardamos a variável na hashtable para quando houver algo como mostra x se conseguir tipar *)
	| Set (ident, e) ->
		Hashtbl.replace ctx ident (type_expression ctx e)
	(* O if, no meu caso, é uma situação especial*)
	| If (e, s) ->
			begin
				match type_expression ctx e with
					(*Verifico inicialmente a expressão entre i se e o então, a ver se é boolean. Assim evito se 1 entao*)
					Tbool ->
							List.iter (stmt_type ctx) s;
					| _ -> raise (Type_Error "Esperava BOOL.")
			end
	| IfElse (e, s1, s2)-> begin
				(*Aqui faço o mesmo só que para 2 stmts*)
				match type_expression ctx e with
					Tbool ->
						List.iter (stmt_type ctx) s1;
						List.iter (stmt_type ctx) s2;
					| _ -> raise (Type_Error "Esperava BOOL.")
					end
	| While (e,s) ->
			begin
				match type_expression ctx e with
					Tbool ->List.iter (stmt_type ctx) s;
					| _ -> raise (Type_Error "Esperava BOOL.")
			end
	| DoWhile (s, e) ->
			begin
				match type_expression ctx e with
					Tbool -> List.iter (stmt_type ctx) s;
					| _ -> raise (Type_Error "Error")
			end
	| For (i, e, s) ->
			Hashtbl.replace ctx i Tint;
			begin
				match type_expression ctx e with
					| Tint -> List.iter (stmt_type ctx) s;
					| _ -> raise (Type_Error "Esperava INT")
			end
	| _ -> ()

let file f = 
	let x = (Hashtbl.create 17) in 
		List.iter (stmt_type x ) f;
		x
