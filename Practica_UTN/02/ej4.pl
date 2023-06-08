% Ingresar una lista de elementos y mostrar sus dos primeros elementos.

inicio:- write("Ingrese una lista de elementos: "), leer(Lista), write(Lista),
    nl, write("Los dos primeros elementos son: "), dosPrimeros(Lista, DosPrimeros),
    write(DosPrimeros).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).
dosPrimeros([H1, H2|_], [H1, H2]). 

%? Otra forma
% inicio:-
%     write('Ingrese una lista de elementos: '), 
%     leer(Lista), 
    
%     write('El primer elemento es: '), 
%     cabeza(Lista, Cabeza, Lista2), write(Cabeza), nl,

%     write('El segundo elemento es: '), 
%     cabeza2(Lista2, Cabeza2), write(Cabeza2), nl.

% leer([H|T]):-read(H), H\=[], leer(T).
% leer([]).
% cabeza([H|T], H, T). 
% cabeza2([H|_], H) :- !.
% cabeza2([], _) :- write('La lista está vacía.'), nl.

%? Otra forma (profe)
% leer([H1|[H2|_]]) :- read(H1), read(H2).