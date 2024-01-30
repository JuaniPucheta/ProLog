% Ingresar una lista de elementos y mostrar su cabeza y su cola.

inicio:-
    write('Ingrese una lista de elementos: '), 
    leer([H|T]), 
    write('La cabeza de la lista es: '), 
    write(H), nl, 
    write('La cola de la lista es: '), 
    cola([H|T], T), 
    write(T), nl.

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

cola([_|T], T).
