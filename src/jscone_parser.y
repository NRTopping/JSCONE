/**
 * @file jscone_parser.y
 * @author NRTopping
 * @date September 17, 2015
 *
 * Basic grammar for parsing, based on Grammar described on http://json.org
 */

%{
  // Included Files 
  extern int yylineno;
  #include <stdio.h>
  #include <stdlib.h>
  #include <stdarg.h>

#if YYBISON
int yylex();
void yyerror(const char *s);

#endif
%}

%union{
  // Values that can be set
  char  *string;
  double number; 
}

// Declare Tokens
%token <string> STRING_TOKEN
%token <number> NUMBER_TOKEN

%token TRUE_TOKEN
%token FALSE_TOKEN
%token NULL_TOKEN

%start object 

%%

// Grammar Rules
object : '{' '}'
       | '{' members '}'
       ;

members : pair
        | pair ',' members
        ;

pair : STRING_TOKEN ':' value
     ;

array : '[' ']'
      | '[' elements ']'
      ;

elements : value
         | value ',' elements
         ;

value : STRING_TOKEN
      | NUMBER_TOKEN
      | object
      | array
      | TRUE_TOKEN
      | FALSE_TOKEN
      | NULL_TOKEN
      ;

%%

void yyerror(const char *s) { 
  fprintf(stderr, "%d: %s\n", yylineno, s);
}
