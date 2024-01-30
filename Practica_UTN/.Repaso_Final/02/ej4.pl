% Ingresar una lista de elementos y mostrar sus dos primeros elementos

inicio:- 
    write("Ingrese una lista de elementos: "), leer(Lista), nl, 
    write("Los dos primeros elementos son: "), dosPrimeros(Lista, DosPrimeros),
    write(DosPrimeros).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

dosPrimeros([H1, H2|_], [H1, H2]).
