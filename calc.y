%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
int symbols[52];
int symbolVal(char symbol); // check symbol table
void updateSymbolVal(char symbol, int val);

%}

%union {int num; char id;}         /* Yacc definitions, specify what types can be returned from our language */
%start line
%token print
%token exit_command
%token pow_command
%token sqrt_command
%token <num> number
%token <id> ID
%type <num> line exp term 
%type <id> assignment

%%

/* descriptions of expected inputs     corresponding actions (in C) */

line    : assignment ';'		{;}
		| exit_command ';'		{exit(EXIT_SUCCESS);}
		| print exp ';'			{printf("Printing %d\n", $2);}
		| line assignment ';'	{;}
		| line print exp ';'	{printf("Printing %d\n", $3);}
		| line exit_command ';'	{exit(EXIT_SUCCESS);}
        ;

assignment : ID '=' exp  { updateSymbolVal($1,$3); }
			;
exp    	: term                  {$$ = $1;}
       	| exp '+' term          {$$ = $1 + $3;}
       	| exp '-' term          {$$ = $1 - $3;}
				| exp '*' term 					{$$ = $1 * $3;}
				| exp '/' term 					{$$ = $1 / $3;}
				| exp pow_command term 	{$$ = pow($1, $3);}
				| exp '+' sqrt_command term {$$ = $1 + sqrt($4);}
				| exp '-' sqrt_command term {$$ = $1 - sqrt($4);}
				| exp '*' sqrt_command term {$$ = $1 * sqrt($4);}
				| exp '/' sqrt_command term {$$ = $1 / sqrt($4);}
				| sqrt_command term {$$ = sqrt($2);}
       	;
term   	: number                {$$ = $1;}
		| ID			{$$ = symbolVal($1);} 
        ;

%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

