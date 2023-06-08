% Ingresar una lista de elementos y mostrar su cabeza y su cola.

inicio:-
    write('Ingrese una lista de elementos: '), 
    leer(Lista), 
    write('La cabeza de la lista es: '), 
    cabeza(Lista, Cabeza), write(Cabeza), nl, 
    write('La cola de la lista es: '), 
    cola(Lista, Cola), 
    write(Cola), nl.

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).
cabeza([H|_], H).
cola([_|T], T).