/*
    Hacer un programa para calcular el factorial de un número. 
        factorial(N,Fact).
        . N es el número ingresado (argumento de entrada). 
        . Fact es el resultado calculado (argumento de salida).
*/

factorial(0,1).
factorial(2,2).
factorial(3,6).

factorial(N,Fact) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, Fact1),
    Fact is N * Fact1.