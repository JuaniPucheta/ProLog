/*
    Ingresar dos listas de elementos y obtener una tercera, cuyos 
    elementos sean la intersección de las dos listas ingresadas. 
*/

%! Importante aprender todos

inicio:- writeln("Ingrese la primera lista: "), leer(L1),
         writeln("Ingrese la segunda lista: "), leer(L2), nl,
         interseccion(L1, L2, L3), 
         write("La lista 3 es: "), write(L3).

leer([H|T]):- read(H), H \= [], leer(T).
leer([]).

interseccion([], _, []).
interseccion(_, [], []).

interseccion([H|T], L2, [H|L3]) :- pertenece(H, L2), interseccion(T, L2, L3).
interseccion([_|T], L2, L3) :- interseccion(T, L2, L3).

pertenece(X, [X|_]).
pertenece(X, [_|T]) :- pertenece(X, T).