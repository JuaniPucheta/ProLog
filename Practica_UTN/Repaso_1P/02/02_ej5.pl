% Ingresar una lista de elementos y mostrar su último elemento.

inicio :- write("Ingrese una lista de elementos: "), 
    leer(Lista), 
    ultimo(Lista, U),
    write("El ultimo elemento es: "), write(U).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

ultimo([H], H).
ultimo([_|T], U) :- ultimo(T, U).