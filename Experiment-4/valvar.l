%{
#include "valvar.tab.h"
%}

%%

[a-zA-Z]    { return LET; }
[0-9]       { return DIG; }
\n          { return 0; }
[ \t]       ;
.           ;

%%

int yywrap(void)
{
    return 1;
}