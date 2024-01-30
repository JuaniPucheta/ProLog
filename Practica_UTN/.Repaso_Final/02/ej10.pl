% Ingresar una lista y un elemento e informar si ese elemento está en la lista.

inicio:- write("Ingrese una lista de elementos: "), 
    leer(Lista), nl,
    write("Elemento a buscar: "), 
    read(Elemento), 
    pertenece(Elemento,Lista).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

pertenece(X, [X|_]).
pertence(X, [_|T]) :- pertenece(X, T).
