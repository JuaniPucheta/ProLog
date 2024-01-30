/*
    Hacer un programa para calcular el factorial de un número. 
        factorial(N,Fact).
        . N es el número ingresado (argumento de entrada). 
        . Fact es el resultado calculado (argumento de salida).
*/

factorial(0, 1).
factorial(N, Fact) :- 
    Ant is N - 1, 
    factorial(Ant, FactAnt), 
    Fact is N * FacAnt. 