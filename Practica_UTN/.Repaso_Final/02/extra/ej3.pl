/*
    Ingresar una lista de elementos y un elemento. Eliminar dicho elemento 
    de la lista y mostrarla por pantalla.
*/

%! Aprender

inicio :- 
    write("Ingrese una lista de elementos: "), leer(Lista),
    write("Ingrese un elemento: "), read(Elemento),
    eliminar(Lista, Elemento, NuevaLista), nl,
    write("La nueva lista queda: "), write(NuevaLista).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

eliminar([], _, []).

eliminar([H|T], Elemento, NuevaLista) :-
    H = Elemento,
    eliminar(T, Elemento, NuevaLista).

eliminar([H|T], Elemento, [H|NuevaLista]) :-
    eliminar(T, Elemento, NuevaLista).
