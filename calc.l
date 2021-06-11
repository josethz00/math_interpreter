%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}

DIGIT       [0-9]
LETTER	    [a-zA-Z_]

ID		    {LETTER}({LETTER}|{DIGIT})*

%%
"print"				   {return print;}
"exit"				   {return exit_command;}
"powerof"            {return pow_command;}
"sqrtof"            {return sqrt_command;}
{ID}		   {yylval.id = yytext[0]; return ID;}
[0-9]+                 {yylval.num = atoi(yytext); return number;}
[ \t\n]                ;
[-+=*/;]           	   {return yytext[0];}
.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}

