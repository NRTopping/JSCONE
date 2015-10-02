##
# @file makefile
# @author NRTopping
# @date September 15, 2015

OUT_EXE = jscone
BISON   = bison
BISONFLAGS = -d
LEX     = flex
LEXSRC  = jscone_lexer.l
LEXC    = lex.yy.c 
LEXOBJ  = lex.yy.o
BISONSRC= jscone_parser.y
BISONC  = jscone_parser.tab.c
BISONOBJ= jscone_parser.tab.o
BISONH  = jscone_parser.tab.h


.PHONY: all
all: $(OUT_EXE)

$(LEXOBJ): $(LEXSRC)
	$(LEX) $^
	$(CC) $(CCFLAGS) -c $(LEXC)

$(BISONOBJ): $(BISONSRC)
	$(BISON) $(BISONFLAGS) $^
	$(CC) $(CCFLAGS) -c $(BISONC) 

$(OUT_EXE): $(BISONOBJ) $(LEXOBJ)
	$(CC) $^ $(CCFLAGS) -ll -o $@

.PHONY: clean
clean:
	rm -f $(LEXC) $(OUT_EXE) $(BISONC) $(BISONH)

