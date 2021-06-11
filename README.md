Basic Math Interpreter
=============

This is a simple math expression interpreter written with C, Lex and Yacc 

1. Use ``` make ``` command in your terminal to compile ```.y```, ```.l``` and ```.c``` files and then run

### Limitations:
  - For now, the language only supports variables with integer variables, not floats neither strings
  - The supported operators are: ```=``` (assignment), ```-``` (subtraction), ```+``` (sum), ```*``` (multiplication), ```/``` (division), ```sqrtof``` (square root of) and ```powerof``` (power of)
  - Operators precedence is not supported yet
### Language grammar examples:
  ```
  a = 10;
  print a;
  ```
  
  ```
  a = 10 + 191;
  print a;
  ```
  
  ```
  a = 90;
  print a;
  a = a + 22;
  print a;
  ```
  
  ```
  a = 10;
  b = 30;
  c = a + b;
  print c;
  ```
  
  
