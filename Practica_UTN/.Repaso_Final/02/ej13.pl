/*
    Ingresar dos listas de elementos, concatenarlas 
    (los elementos deben ser asignados de a uno en la lista de salida) 
    y mostrarlas en una tercera.
*/

%! Importante aprender 

inicio:- 
    write('Ingrese la primer lista: '), leer(L1), nl,
    write('Ingrese la segunda lista: '), leer(L2), nl,
    concatenar(L1, L2, L3),
    write('La lista concatenada es: '), write(L3).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

concatenar([], [], []).
concatenar(L1, [], L1).
concatenar([], L2, L2).

concatenar([H|T], L2, [H|T3]) :- concatenar(T, L2, T3).

%? Forma de mostrar una lista sin el [...]
    % mostrar([H|T]):- write(H), write(' '), mostrar(T).
    % mostrar([]).
