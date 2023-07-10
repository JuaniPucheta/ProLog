/*
    Ingresar una lista de elementos y un elemento. Eliminar dicho elemento 
    de la lista y mostrarla por pantalla.
*/

inicio:- write("Ingrese una lista de elementos: "), leer(Lista),
    write("Ingrese un elemento: "), read(Elemento),
    eliminar(Lista, Elemento, ListaNueva),
    write("Lista sin el elemento: "), write(ListaNueva).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

eliminar([], _, []). % Si la lista esta vacia, no hay nada que eliminar.
eliminar([H|T], Elemento, ListaNueva):- H=Elemento, eliminar(T, Elemento, ListaNueva). 
    % Si el elemento es igual al primer elemento de la lista, no se agrega a la nueva lista.
eliminar([H|T], Elemento, [H|ListaNueva]):- eliminar(T, Elemento, ListaNueva). 
    % Si el elemento no es igual al primer elemento de la lista, se agrega a la nueva lista.

