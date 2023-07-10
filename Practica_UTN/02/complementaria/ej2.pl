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

inicio:- write("Ingrese la primer lista: "), leer(Lista1),
    write("Ingrese la segunda lista: "), leer(Lista2),
    concatenar(Lista1, Lista2, Lista3),
    write("La lista concatenada dejando elementos en comun una vez es: "), write(Lista3).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

concatenar([], L, L).
concatenar([H|T], L, Lista3):- pertenece(H, L), concatenar(T, L, Lista3).
concatenar([H|T], L, [H|Lista3]):- concatenar(T, L, Lista3).

pertenece(X, [X|_]).
pertenece(X, [_|T]):- pertenece(X, T).
