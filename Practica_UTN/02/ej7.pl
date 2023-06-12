% Ingresar una lista de elementos e informar cuántos elementos tiene.

inicio :- write("Ingrese una lista de elementos: "), leer(Lista), 
    contar(Lista, Cantidad), 
    write("La lista tiene "), 
    write(Cantidad), 
    write(" elementos.").

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

contar([], 0). % si la lista está vacía, la cantidad de elementos es 0
contar([_|T], Cantidad) :- % si la lista no está vacía, la cantidad de elementos es 1 más la cantidad de elementos de la cola
    contar(T, Cantidad1),  
    Cantidad is Cantidad1 + 1.  