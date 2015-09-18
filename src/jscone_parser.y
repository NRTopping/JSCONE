/**
 * @file jscone_parser.y
 * @author NRTopping
 * @date September 17, 2015
 *
 * Basic grammar for parsing, based on Grammar described on http://json.org
 */

%{
  // Included Files 
%}

%union{
  // Values that can be set
  char  *string;
  double number; 
}

// Declare Tokens
%token <string> STRING
%token <number> NUMBER

%token TRUE
%token FALSE
%token NULL

%start object 

%%

// Grammar Rules
object : '{' '}'
       | '{' members '}'
       ;

members : pair
        | pair ',' members
        ;

pair : string ':' value
     ;

array : '[' ']'
      | '[' elements ']'
      ;

elements : value
         | value ',' elements
         ;

value : STRING
      | NUMBER
      | object
      | array
      | TRUE
      | FALSE
      | NULL
      ;
