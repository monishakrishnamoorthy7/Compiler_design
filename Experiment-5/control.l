%{
#include "control.tab.h"
%}

%%

"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }

[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }
[0-9]+                   { return NUM; }

"("        { return LPAREN; }
")"        { return RPAREN; }
"{"        { return LBRACE; }
"}"        { return RBRACE; }
";"        { return SEMICOLON; }

"=="|"<="|">="|"<"|">"   { return RELOP; }
"="        { return ASSIGN; }

[ \t\n]+   ;
.          { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}