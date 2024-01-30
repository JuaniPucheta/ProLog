/*
    Ingresar dos listas de elementos y formar una tercera con los elementos 
    de ambas listas, dejando los elementos en común una única vez.
*/

/*
    Ejemplo:
    Lista 1: 1, 2, 3, 4, 5
    Lista 2: 4, 5, 6, 7, 8
    Lista 3: 1, 2, 3, 4, 5, 6, 7, 8
*/

%! Aprender y diferenciar con `interseccion` y `concatenar`

inicio:- write("Ingrese la primer lista: "), leer(L1),
    write("Ingrese la segunda lista: "), leer(L2),
    concatenar(L1, L2, L3),
    write("La lista concatenada dejando elementos en comun una vez es: "), write(L3).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

concatenar([], [], []).
concatenar(L1, [], L1).
concatenar([], L2, L2).

concatenar([H|T], L2, L3) :- pertenece(H, L2), concatenar(T, L2, L3).
concatenar([H|T], L2, [H|L3]) :- concatenar(T, L2, L3).

pertenece(X, [X|_]).
pertenece(X, [_|T]) :- pertenece(X, T).