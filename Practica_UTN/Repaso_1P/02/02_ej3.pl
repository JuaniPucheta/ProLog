% Ingresar una lista de elementos y mostrar su primer elemento.

inicio :- write("Ingrese una lista de elementos: "), leer(Lista),
    primer_elemento(Lista, H), 
    write("El primer elemento es: "), 
    write(H).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

primer_elemento([H|_], H).

%? otra forma
% inicio :- write("Ingrese una lista de elementos: "), leer([H|_]),
%     write("El primer elemento es: "), 
%     write(H).

% leer([H|T]) :- read(H), H \= [], leer(T).
% leer([]).