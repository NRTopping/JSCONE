/**
 * @file jscone_lexer.l
 * @author NRTopping
 * @date September 14, 2015
 *
 * Parses JSON tokens from standard in, outputs the tokens to stdout. Error and
 * warning messages are printed to stderr. 
 */

%{
  #include <stdio.h>


  #include "jscone_parser.tab.h"
  // TODO add definitions 


%}

  /* Definitions Section */
%option nounput
%option yylineno 
%option nodefault
%option noyywrap

STRING      \"([^"\\]|\\([\\\/bfnrt]|u[0-9a-fA-F]{4})])*\"
NUMBER      -?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][+-]?[0-9]+)?
TRUE        true
FALSE       false
NULL        null
WHITESPACE  [ \t\v\f\r\n]

%%
  /* Rules Section */
{WHITESPACE}  { /* Ignore Whitespace */ }
{STRING}      printf("JSON_STRING:<%s>\n",yytext); 
{NUMBER}      printf("JSON_NUMBER:<%s>\n",yytext);
"["           printf("%s\n",yytext);
"]"           printf("%s\n",yytext);
"{"           printf("%s\n",yytext);
"}"           printf("%s\n",yytext);
":"           printf("%s\n",yytext);
","           printf("%s\n",yytext);
.             printf("UNKNOWN CHARACTER: %s\n",yytext);

%%
  /* User Code Section */

int main() {
  /*yylex(); // Run lexer*/
  yyparse();
  yylex_destroy(); // Clean up lexer
  return 0;
}
