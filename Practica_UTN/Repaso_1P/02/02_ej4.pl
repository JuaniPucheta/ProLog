% Ingresar una lista de elementos y mostrar sus dos primeros elementos.

inicio :- write("Ingrese una lista de elementos: "), 
    leer(Lista),
    dos_elementos(Lista, Dos),
    write("Los dos primeros elementos son: "), write(Dos).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

dos_elementos([H1, H2|_], [H1, H2]).
