% Ingresar dos listas de elementos, concatenarlas (los elementos deben
% ser asignados de a uno en la lista de salida) y mostrarlas en una
% tercera.

inicio:- write('Ingrese la primer lista: '), 
    leer(L1),
    write('Ingrese la segunda lista: '), leer(L2),
    concatenar(L1, L2, L3),
    write('La lista concatenada es: '), mostrar(L3).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

concatenar([], L2, L2).
concatenar([H|T], L2, [H|L3]):- concatenar(T, L2, L3).

mostrar([H|T]):- write(H), write(' '), mostrar(T).
mostrar([]).
    