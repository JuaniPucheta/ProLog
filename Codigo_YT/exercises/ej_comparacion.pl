%? EJERCICIO 01 de Comparaciones-------------------
masgrande(elefante,caballo).
masgrande(caballo,perro).

muchomasgrande(A,C):-masgrande(A,B),masgrande(B,C).
%? ------------------------------------------------

%? EJERCICIO 02 de Comparaciones-------------------
masgrande(elefante,caballo).
masgrande(caballo,perro).
masgrande(perro,raton).
masgrande(raton,hormiga).

muchomasgrande(A,B):-masgrande(A,B).
muchomasgrande(A,B):-masgrande(A,X),muchomasgrande(X,B).
%? ------------------------------------------------