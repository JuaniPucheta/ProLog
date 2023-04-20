/*
    Hacer un programa que permita ingresar un número y calcule la sumatoria 
        de sus términos descontados en una unidad (hasta llegar a cero) pares e impares. 
        
    suma(N,SumPares,SumImpares).

        . N es el número ingresado (argumento de entrada). 
        . SumPares es uno de los resultados calculados (argumento de salida). 
        . SumImpares es uno de los resultados calculados (argumento de salida).
*/

suma(10, 30, 25).
suma(N, SumPares, SumImpares) :-
   N > 0,
   M is N - 1,
   suma(M, P2, I2),
   ((N mod 2) =:= 0 ->
      SumPares is N + P2,
      SumImpares is I2
   ;
      SumImpares is N + I2,
      SumPares is P2
   ).

/* %? EXPLICACIÓN DEL CÓDIGO 
    El predicado suma/3 tiene tres argumentos: N, que es el número ingresado y SumImparesy SumPares, 
        que son los resultados calculados.

    En la primera cláusula del predicado suma/3, si N es igual a cero, 
        ambas sumatorias (SumPares y SumImpares) se establecen en cero.

    En la segunda cláusula del predicado suma/3, si N es mayor que cero, 
        restamos uno a N y llamamos recursivamente al predicado suma/3 con M como nuevo valor de N. 
        Los resultados se almacenan en las variables temporales P2 e I2.

    Luego, utilizamos un condicional if-then-else para calcular las 
        sumatorias de los números pares e impares.

    Si N es par, sumamos N a la sumatoria de los números pares almacenada en P2, 
        lo que nos da la nueva sumatoria de los números pares SumPares. 
        La sumatoria de números impares se mantiene en I2, por lo que se establece como SumImpares.

    Si N es impar, sumamos N a la sumatoria de los números impares almacenada en I2, 
        lo que nos da la nueva sumatoria de los números impares SumImpares. 
        La sumatoria de los números pares se mantiene en P2, por lo que se establece como SumPares.
*/