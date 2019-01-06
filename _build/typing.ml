open Ast

exception Type_Error of string

type types =
	 Tnone
	| Tint
	| Tbool

let analyse_cst = function
	| Int _ -> Tint
	| Bool _ -> Tbool
	| _ -> Tnone

let rec type_expression ctx = function
	(* Aqui vou verificar as expressões binárias como verdade e falso e só aceito tipos iguais (Tbool com Tbool) *)
	Bop (o, e1, e2) -> 
	begin
		let typee1 = type_expression ctx e1 in
		let typee2 = type_expression ctx e2 in
		match o with
		Beq | Leq | Bg | Ls -> if(typee1 = Tint && typee1 = typee2) then Tbool else (raise (Type_Error "Esperava INT, mas foi dado BOOL."))
		| _ -> if(typee1 = Tbool && typee2 = typee1) then typee1 else (raise (Type_Error "Esperava tipo BOOL, mas foi dado INT."))
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
		if( typee1 = Tint && typee2 = typee1) then typee1 else (raise (Type_Error "Esperava tipo INT, mas foi dado BOOL."))

let rec stmt_type ctx = function
	(* As stmt não têm tipo, ou seja, não retornam nada. PRINT é to tipo UNIT, só tenhos de virificar o que está à frente*)
	Print e ->
		begin
			match type_expression ctx e with
			Tint -> ()
			| Tbool -> ()
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
					Tbool -> let x = Hashtbl.create 17 in (*Aqui sabemos que é 1, logo vamos criar um context diferente do anterior apenas para dentro do if*)
							List.iter (stmt_type x) s;(*E verificamos nesse cotexto apenas*)
					| _ -> raise (Type_Error "Esperava BOOL.")
			end
	| IfElse (e, s1, s2)-> begin
				(*Aqui faço o mesmo só que para 2 stmts*)
				match type_expression ctx e with
					Tbool -> let x = Hashtbl.create 17 in
						List.iter (stmt_type x) s1; (*Crio um contexto para cada stmt*)
						let y = Hashtbl.create 17 in 
						List.iter (stmt_type y) s2;
					| _ -> raise (Type_Error "Esperava BOOL.")
					end
	| _ -> ()

let file f = 
	let x = (Hashtbl.create 17) in 
		List.iter (stmt_type x ) f;
		x
