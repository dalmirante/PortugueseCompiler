CMO=PortLexer.cmo PortParser.cmo typing.cmo mips.cmo compile.cmo main.cmo
GENERATED = PortLexer.ml PortParser.ml PortParser.mli
BIN=port
FLAGS=

all: $(BIN)

$(BIN):$(CMO)
	ocamlc $(FLAGS) -o $(BIN) $(CMO)

.SUFFIXES: .mli .ml .cmi .cmo .mll .mly

.mli.cmi:
	ocamlc $(FLAGS) -c  $<

.ml.cmo:
	ocamlc $(FLAGS) -c  $<

.mll.ml:
	ocamllex $<

.mly.ml:
	menhir -v $<

.mly.mli:
	ocamlyacc -v $<

clean:
	rm -f *.cm[io] *.o *~ $(BIN) $(GENERATED) parser.output

.depend depend:$(GENERATED)
	rm -f .depend
	ocamldep *.ml *.mli > .depend

include .depend