/*
    Hacer un programa que permita ingresar un número y calcule su sumatoria, es decir, 
        la suma de sus términos descontados en una unidad hasta llegar a cero. 
    Por ejemplo, si el número ingresado fuera 5, se deberá calcular la sumatoria 5+4+3+2+1 e informar como resultado 15.
    suma(N,Sum).
        . N es el número ingresado (argumento de entrada). 
        . Sum es el resultado calculado (argumento de salida).
*/

suma(5,15).
suma(N,Sum) :-          % N = 5
    N > 0,              % 5 > 0
    N1 is N-1,          % N1 = 5-1 = 4
    suma(N1,Sum1),      % suma(4,Sum1)
    Sum is Sum1+N.      % Sum = Sum1+5 = 15