% Ingresar una lista de números enteros y calcular su promedio. 
% Respetar el formato del predicado promedio(L,S,C) 
% donde L es la lista ingresada, S la sumatoria y C el contador de los elementos de la lista.

inicio :- write('Ingrese una lista de numeros enteros: '), leer(L), 
    promedio(L, S, C),
    Promedio is S/C,
    write("El promedio es: "), write(Promedio).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

promedio([], 0, 0).
promedio([H|T], S, C) :-
    promedio(T, S1, C1),
    S is S1 + H,
    C is C1 + 1.