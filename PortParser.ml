
module MenhirBasics = struct
  
  exception Error
  
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
    | IDENT of (
# 6 "PortParser.mly"
       (string)
# 25 "PortParser.ml"
  )
    | EQ
    | EOF
    | ELSE
    | DIV
    | CST of (
# 5 "PortParser.mly"
       (Ast.cst)
# 34 "PortParser.ml"
  )
    | BIG
    | BEQ
    | AND
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState39
  | MenhirState34
  | MenhirState32
  | MenhirState29
  | MenhirState27
  | MenhirState25
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState17
  | MenhirState15
  | MenhirState13
  | MenhirState11
  | MenhirState9
  | MenhirState7
  | MenhirState3
  | MenhirState0

# 1 "PortParser.mly"
  
    open Ast

# 77 "PortParser.ml"

let rec _menhir_run34 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | PRINT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | SET ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_goto_stmts : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv151 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv147 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ELSE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv139 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | LP ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv135 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | IF ->
                        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39
                    | PRINT ->
                        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39
                    | SET ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv136)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv137 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts))) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)) : 'freshtv140)
            | TEST ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv143 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv141 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (e : 'tv_expr)), _, (s : 'tv_stmts)) = _menhir_stack in
                let _7 = () in
                let _6 = () in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_stmt = 
# 41 "PortParser.mly"
                                                                   ( If(e, List.rev s) )
# 155 "PortParser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv142)) : 'freshtv144)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv145 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)) : 'freshtv148)
        | SEMICOLON ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv149 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)) : 'freshtv152)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv163 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv159 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | TEST ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv155 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv153 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let ((((_menhir_stack, _menhir_s), _, (e : 'tv_expr)), _, (s1 : 'tv_stmts)), _, (s2 : 'tv_stmts)) = _menhir_stack in
                let _11 = () in
                let _10 = () in
                let _8 = () in
                let _7 = () in
                let _6 = () in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_stmt = 
# 42 "PortParser.mly"
                                                                   ( IfElse(e, List.rev s1, List.rev s2) )
# 204 "PortParser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv154)) : 'freshtv156)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv157 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)) : 'freshtv160)
        | SEMICOLON ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv161 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)) : 'freshtv164)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv177 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv173 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv171 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (s : 'tv_stmts)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 20 "PortParser.mly"
      (Ast.seq)
# 239 "PortParser.ml"
            ) = 
# 25 "PortParser.mly"
                    (List.rev s)
# 243 "PortParser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 20 "PortParser.mly"
      (Ast.seq)
# 251 "PortParser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 20 "PortParser.mly"
      (Ast.seq)
# 259 "PortParser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv165) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 20 "PortParser.mly"
      (Ast.seq)
# 267 "PortParser.ml"
            )) : (
# 20 "PortParser.mly"
      (Ast.seq)
# 271 "PortParser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv166)) : 'freshtv168)) : 'freshtv170)) : 'freshtv172)) : 'freshtv174)
        | SEMICOLON ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv175 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)) : 'freshtv178)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmt -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_stmt) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv127 * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((s2 : 'tv_stmt) : 'tv_stmt) = _v in
        ((let (_menhir_stack, _menhir_s, (s1 : 'tv_stmts)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_stmts = 
# 29 "PortParser.mly"
                                          ( s2 :: s1 )
# 308 "PortParser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv128)) : 'freshtv130)
    | MenhirState0 | MenhirState32 | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_stmt) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((s : 'tv_stmt) : 'tv_stmt) = _v in
        ((let _v : 'tv_stmts = 
# 28 "PortParser.mly"
                                          ( [s] )
# 323 "PortParser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv132)) : 'freshtv134)
    | _ ->
        _menhir_fail ()

and _menhir_run7 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run9 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run11 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv53 * _menhir_state) * (
# 6 "PortParser.mly"
       (string)
# 478 "PortParser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | BIG ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | LESS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | EOF | RP | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv49 * _menhir_state) * (
# 6 "PortParser.mly"
       (string)
# 508 "PortParser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (i : (
# 6 "PortParser.mly"
       (string)
# 513 "PortParser.ml"
            ))), _, (e : 'tv_expr)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_stmt = 
# 40 "PortParser.mly"
                                                            ( Set(i, e) )
# 520 "PortParser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv50)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv51 * _menhir_state) * (
# 6 "PortParser.mly"
       (string)
# 530 "PortParser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)) : 'freshtv54)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv57 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv55 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
        let _10 = () in
        let _v : 'tv_expr = let o =
          let _1 = _10 in
          
# 49 "PortParser.mly"
            (Times)
# 546 "PortParser.ml"
          
        in
        
# 35 "PortParser.mly"
                                        ( Op(o, e1, e2) )
# 552 "PortParser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv56)) : 'freshtv58)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv63 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | AND | BEQ | BIG | EOF | LEQ | LESS | MINUS | OR | PLUS | RP | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv59 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 46 "PortParser.mly"
          (Plus)
# 575 "PortParser.ml"
              
            in
            
# 35 "PortParser.mly"
                                        ( Op(o, e1, e2) )
# 581 "PortParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv60)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv61 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)) : 'freshtv64)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv67 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv65 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
        let _10 = () in
        let _v : 'tv_expr = let o =
          let _1 = _10 in
          
# 48 "PortParser.mly"
            (Div)
# 603 "PortParser.ml"
          
        in
        
# 35 "PortParser.mly"
                                        ( Op(o, e1, e2) )
# 609 "PortParser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv66)) : 'freshtv68)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv73 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | AND | BEQ | BIG | EOF | LEQ | LESS | OR | RP | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv69 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 53 "PortParser.mly"
            (Or)
# 636 "PortParser.ml"
              
            in
            
# 34 "PortParser.mly"
                                        ( Bop(o, e1, e2) )
# 642 "PortParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv70)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv71 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)) : 'freshtv74)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv79 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | AND | BEQ | BIG | EOF | LEQ | LESS | MINUS | OR | PLUS | RP | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv75 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 47 "PortParser.mly"
            (Minus)
# 672 "PortParser.ml"
              
            in
            
# 35 "PortParser.mly"
                                        ( Op(o, e1, e2) )
# 678 "PortParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv76)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv77 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)) : 'freshtv80)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv85 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | AND | BEQ | BIG | EOF | LEQ | LESS | OR | RP | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv81 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 56 "PortParser.mly"
            (Ls)
# 712 "PortParser.ml"
              
            in
            
# 34 "PortParser.mly"
                                        ( Bop(o, e1, e2) )
# 718 "PortParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv82)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv83 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)) : 'freshtv86)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv91 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | AND | BEQ | BIG | EOF | LEQ | LESS | OR | RP | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv87 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 57 "PortParser.mly"
            (Leq)
# 752 "PortParser.ml"
              
            in
            
# 34 "PortParser.mly"
                                        ( Bop(o, e1, e2) )
# 758 "PortParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv88)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv89 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)) : 'freshtv92)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | AND | BEQ | BIG | EOF | LEQ | LESS | OR | RP | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv93 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 55 "PortParser.mly"
            (Bg)
# 792 "PortParser.ml"
              
            in
            
# 34 "PortParser.mly"
                                        ( Bop(o, e1, e2) )
# 798 "PortParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv94)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv95 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)) : 'freshtv98)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv103 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | AND | BEQ | BIG | EOF | LEQ | LESS | OR | RP | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv99 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 54 "PortParser.mly"
            (Beq)
# 832 "PortParser.ml"
              
            in
            
# 34 "PortParser.mly"
                                        ( Bop(o, e1, e2) )
# 838 "PortParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv100)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv101 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)) : 'freshtv104)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv109 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | AND | BEQ | BIG | EOF | LEQ | LESS | OR | RP | SEMICOLON | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv105 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (e1 : 'tv_expr)), _, (e2 : 'tv_expr)) = _menhir_stack in
            let _10 = () in
            let _v : 'tv_expr = let o =
              let _1 = _10 in
              
# 52 "PortParser.mly"
            (And)
# 872 "PortParser.ml"
              
            in
            
# 34 "PortParser.mly"
                                        ( Bop(o, e1, e2) )
# 878 "PortParser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv106)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv107 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)) : 'freshtv110)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv115 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | BIG ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | LESS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | EOF | RP | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv111 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (e : 'tv_expr)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_stmt = 
# 39 "PortParser.mly"
                                                            ( Print e )
# 922 "PortParser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv113 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)) : 'freshtv116)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | BIG ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | LESS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv121 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv117 * _menhir_state) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IF ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                | PRINT ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                | SET ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv118)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv119 * _menhir_state) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)) : 'freshtv122)
        | TIMES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv123 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)) : 'freshtv126)
    | _ ->
        _menhir_fail ()

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "PortParser.mly"
       (string)
# 1000 "PortParser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv47) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 6 "PortParser.mly"
       (string)
# 1010 "PortParser.ml"
    )) : (
# 6 "PortParser.mly"
       (string)
# 1014 "PortParser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 33 "PortParser.mly"
                                        ( Ident i )
# 1019 "PortParser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv48)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "PortParser.mly"
       (Ast.cst)
# 1026 "PortParser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv45) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 5 "PortParser.mly"
       (Ast.cst)
# 1036 "PortParser.ml"
    )) : (
# 5 "PortParser.mly"
       (Ast.cst)
# 1040 "PortParser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 32 "PortParser.mly"
                                        ( Cst c )
# 1045 "PortParser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv46)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv11 * _menhir_state) * _menhir_state * 'tv_expr))) * _menhir_state * 'tv_stmts)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv13 * _menhir_state * 'tv_stmts)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv15 * _menhir_state) * _menhir_state * 'tv_expr))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv21 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv25 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv31 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv37 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * (
# 6 "PortParser.mly"
       (string)
# 1132 "PortParser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv44)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 6 "PortParser.mly"
       (string)
# 1153 "PortParser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv3 * _menhir_state) * (
# 6 "PortParser.mly"
       (string)
# 1164 "PortParser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv4)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv5 * _menhir_state) * (
# 6 "PortParser.mly"
       (string)
# 1184 "PortParser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv6)) : 'freshtv8)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and seq : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 20 "PortParser.mly"
      (Ast.seq)
# 1241 "PortParser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PRINT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SET ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 233 "/Users/DiogoSilva/.opam/4.06.1/lib/menhir/standard.mly"
  

# 1274 "PortParser.ml"
