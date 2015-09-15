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

  // TODO add definitions 

%}

  /* Definitions Section */
%option nounput
%option yylineno  

STRING  \"([^"\\]|\\([\\\/bfnrt]|u[0-9a-fA-F]{4})"])*\"
NUMBER  -?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][+-]?[0-9]+)?
TRUE    true
FALSE   false
NULL    null


%%
  /* Rules Section */

%%
  /* User Code Section */
