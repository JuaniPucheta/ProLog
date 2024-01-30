% Ingresar una lista y un elemento e informar cuántas veces está ese elemento en la lista.

%! Importante aprender

inicio:- write("Ingrese una lista: "), 
    leer(Lista), 
    write("Ingrese un elemento: "), 
    read(Elemento), 
    contar(Lista, Elemento, Cantidad), nl,
    write("El elemento `"), write(Elemento), 
    write("` aparece `"), write(Cantidad), write("` veces en la lista ").

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

contar([], _, 0).   %* Si la lista es vacia, no importa lo que ingrese, la cantidad es 0

contar([H|T], Elemento, Cantidad) :-
    H = Elemento,
    contar(T, Elemento, Can),
    Cantidad is Can + 1.

contar([_|T], Elemento, Cantidad) :-
    contar(T, Elemento, Cantidad).
