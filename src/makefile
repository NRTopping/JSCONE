##
# @file makefile
# @author NRTopping
# @date September 15, 2015

OUT_EXE = jscone
CFLAGS  = -ll
LEX     = flex
LEXSRC  = jscone_lexer.l
LEXC    = lex.yy.c 

.PHONY: all
all: $(OUT_EXE)

$(LEXC): $(LEXSRC)
	$(LEX) $^

$(OUT_EXE): $(LEXC)
	$(CC) $^ $(CFLAGS) -o $@

.PHONY: clean
clean:
	rm -f $(LEXC) $(OUT_EXE)

