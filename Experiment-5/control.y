%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token IF ELSE WHILE
%token ID NUM
%token LPAREN RPAREN LBRACE RBRACE
%token ASSIGN RELOP SEMICOLON

%%

program
    : stmt
    ;

stmt
    : if_stmt
    | while_stmt
    ;

if_stmt
    : IF LPAREN cond RPAREN block
    | IF LPAREN cond RPAREN block ELSE block
    ;

while_stmt
    : WHILE LPAREN cond RPAREN block
    ;

block
    : LBRACE RBRACE
    ;

cond
    : ID RELOP NUM
    ;

%%

int main()
{
    printf("Enter a C control structure:\n");
    yyparse();
    printf("Valid control structure syntax.\n");
    return 0;
}

void yyerror(const char *s)
{
    printf("Invalid control structure syntax.\n");
    exit(0);
}