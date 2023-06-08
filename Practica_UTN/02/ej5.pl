% Ingresar una lista de elementos y mostrar su último elemento.

inicio :- write("Ingrese una lista de elementos: "), 
    leer(Lista), 
    ultimo(Lista, Ultimo), 
    write("El ultimo elemento es: "), 
    write(Ultimo).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).
ultimo([H|[]], H).  % [H|[]] se puede escribir como [H]. Esto es para validar si hay un solo elemento
ultimo([_|T], Ultimo) :- ultimo(T, Ultimo).

