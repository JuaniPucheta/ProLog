% Ingresar una lista de elementos e informar cuántos elementos tiene.

inicio :- write("Ingrese una lista de elementos: "), leer(Lista), 
    contar(Lista, Cantidad),
    write("La lista tiene: "), write(Cantidad), write(" elementos").

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

contar([], 0).
contar([_|T], C) :- 
    contar(T, C1),
    C is C1 + 1.