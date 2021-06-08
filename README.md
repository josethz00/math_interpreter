Basic Math Interpreter
=============

This is a simple math expression interpreter written with C, Lex and Yacc 

1. Use ``` make ``` command in your terminal to compile ```.y```, ```.l``` and ```.c``` files
2. And then to run the interpreter, type ```./calc```

### Limitations:
  - For now, the language only supports variables with one character in the name, and this character must be a alfabet letter 
  - The supported operators are ```=``` (assignment), ```-``` (subtraction) and ```+``` (sum)
  - ```\``` (division), ```*``` (multiplication), ```**``` (potentiation) are not supported yet 
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
  
  
