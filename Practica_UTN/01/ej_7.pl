/*
    Escribir un programa que simule una calculadora para las operaciones matemáticas básicas 
    (suma, resta, multiplicación y división) entre dos valores numéricos, informando el resultado.
*/

%hechos
suma(A,B,R) :- R is A + B.
resta(A,B,R) :- R is A - B.
multiplicacion(A,B,R) :- R is A * B.
division(A,B,R) :- R is A / B.