
(* Ficheiro principal do compilador arithc *)

open Format
open Lexing
open PortLexer
open PortParser
open Compile


let parse_only = ref false

let usage = "Usar: port ficheiro.pt"

(* Nome dos ficheiros fonte e alvo *)
let ifile = 
let ifile = ref None in
  let set_file s =
    if not (Filename.check_suffix s ".pt") then
      raise (Arg.Bad "Introduza um ficheiro .pt");
    ifile := Some s
  in
  Arg.parse [] set_file usage;
  match !ifile with Some f -> f | None -> Arg.usage [] usage; exit 1

let localisation pos =
  let l = pos.pos_lnum in
  let c = pos.pos_cnum - pos.pos_bol + 1 in
  eprintf "No ficheiro \"%s\", na linha %d e caracteres %d-%d, " ifile l (c-1) c 

let () = 
  if ifile="" then begin eprintf "Algum ficheiro a Compilar\n@?"; exit 1 end;

  (* Abertura do ficheiro fonte em modo leitura *)
  let f = open_in ifile in

  (* Criação do buffer de análise léxica *)
  let buf = Lexing.from_channel f in

   try
    let p = PortParser.seq PortLexer.token buf in
    close_in f;

    let ctxType = Typing.file p in
      Compile.compile_prog p ctxType;
  
  with
      | PortLexer.Lexing_error c ->
    (* Erro léxico. Recupera-se a posição absoluta e converte-se para número 
            de linha *)
    localisation (Lexing.lexeme_start_p buf);
    eprintf "erro durante a análise léxica: %s@." c;
    exit 1
      | PortParser.Error ->
    (* Erro sintáctio. Recupera-se a posição e converte-se para número 
            de linha *)
    localisation (Lexing.lexeme_start_p buf);
    eprintf "erro durante a análise sintáctica@.";
    exit 1
    | Typing.Type_Error c ->
          localisation (Lexing.lexeme_start_p buf);
          eprintf "erro durante a tipagem: %s@." c;
          exit 1




