% Ingresar una lista de elementos y mostrar su primer elemento.

inicio:-
    write('Ingrese una lista de elementos: '), 
    % leer([H|T]), nl,  %* --> 1/2 esta es mejor
    leer(Lista), nl,
    primer_elemento(Lista, Primero),
    write('El primer elemento es: '), 
    % write(H).         %* --> 2/2 esta es mejor
    write(Primero).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

primer_elemento([], []).
primer_elemento([H], H).
