/*
    Ingresar dos listas de elementos y obtener una tercera, cuyos 
    elementos sean la intersección de las dos listas ingresadas. 
*/

inicio:- writeln("Ingrese la primera lista: "), leer(Lista1),
         writeln("Ingrese la segunda lista: "), leer(Lista2),
         interseccion(Lista1, Lista2, Lista3),
         write("La lista 3 es: "), write(Lista3).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

interseccion([], _, []).
interseccion([H|T], Lista2, [H|Lista3]):- pertenece(H, Lista2), !, interseccion(T, Lista2, Lista3). % el ! es para que no se quede buscando mas soluciones
interseccion([_|T], Lista2, Lista3):- interseccion(T, Lista2, Lista3).

pertenece(X, [X|_]).
pertenece(X, [_|T]):- pertenece(X, T).