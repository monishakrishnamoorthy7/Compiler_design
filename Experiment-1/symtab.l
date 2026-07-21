%{
#include <stdio.h>
%}

LETTER  [a-zA-Z]
DIGIT   [0-9]
ID      {LETTER}({LETTER}|{DIGIT})*

%%

int|float|char|double|void|return|if|else|for|while    { printf("Keyword\t\t%s\n", yytext); }

{ID}           { printf("Identifier\t%s\n", yytext); }

[0-9]+         { printf("Number\t\t%s\n", yytext); }

"+"|"-"|"*"|"/"|"="|"=="|"<"|">"|"<="|">="   { printf("Operator\t%s\n", yytext); }

";"|","|"("|")"|"\{"|"\}"    { printf("Symbol\t\t%s\n", yytext); }

[ \t\n]+       ;

.              { printf("Unknown\t\t%s\n", yytext); }

%%

int yywrap(void)
{
    return 1;
}

int main(void)
{
    printf("Enter C Program:\n");
    yylex();
    return 0;
}