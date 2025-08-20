/* calculator #2
   note that the first #include
   here needed to have the named changed b/c
   this is the custom name coming from our
   makefile outputs for `calc2` target
   if you do not do this then your call
   to make will raise an error
   e.g. the `y.tab.h` should change when
   the makefile output for the corresponding
   yacc call
*/
%{
    #include "calc2parser.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
%}

%%

[a-z]       {
                yylval = *yytext - 'a';
                return VARIABLE;
                }

[0-9]+      {
                yylval = atoi(yytext);
                return INTEGER;
            }

[-+()=/*\n]     { return *yytext; }

[ \t]   ;       /* skip whitespace */

.               yyerror("Unknown character");

%%

int yywrap(void) {
    return 1;
}
