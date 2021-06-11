run: calc
	./calc.out

calc: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -lm -o calc.out

lex.yy.c: y.tab.c calc.l
	lex calc.l

y.tab.c: calc.y
	yacc -d calc.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h calc.out calc.dSYM

