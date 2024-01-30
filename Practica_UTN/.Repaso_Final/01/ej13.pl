/*
    Hacer un programa que permita ingresar un número y calcule la sumatoria 
        de sus términos descontados en una unidad (hasta llegar a cero) pares e impares. 
        
    suma(N,SumPares,SumImpares).

        . N es el número ingresado (argumento de entrada). 
        . SumPares es uno de los resultados calculados (argumento de salida). 
        . SumImpares es uno de los resultados calculados (argumento de salida).
*/

inicio :- write('Ingrese un numero para calcular su sumatoria: '),
    read(N),
    suma(N, SumPares, SumImpares),
    write('La suma de los pares: '), write(SumPares), nl,
    write('La suma de los impares: '), write(SumImpares).

suma(0, 0, 0).
suma(N, SumPares, SumImpares) :- 
    0 is mod(N, 2),
    Ant is N - 1,
    suma(Ant, Pares, SumImpares),
    SumPares is N + Pares.
suma(N, SumPares, SumImpares) :-
    Ant is N - 1,
    suma(Ant, SumPares, Imp),
    SumImpares is N + Imp.
