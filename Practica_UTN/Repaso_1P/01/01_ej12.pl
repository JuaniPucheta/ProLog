/*
    Hacer un programa que permita ingresar un número y calcule su sumatoria, es decir, 
        la suma de sus términos descontados en una unidad hasta llegar a cero. 
    Por ejemplo, si el número ingresado fuera 5, se deberá calcular la sumatoria 5+4+3+2+1 e informar como resultado 15.
    suma(N,Sum).
        . N es el número ingresado (argumento de entrada). 
        . Sum es el resultado calculado (argumento de salida).
*/

suma(0, 0).     %! importante, sino no funciona. Con esto defino la clausula de fin
suma(N, Sum) :- 
    N > 0, 
    N1 is N - 1, 
    suma(N1, Sum1), 
    Sum is Sum1 + N.

inicio :- 
    write("Ingrese el numero a calcular sumatoria: "), 
    read(N),
    suma(N,Sum),
    write("La sumatoria es: "), write(Sum).

