% Ingresar una lista de elementos y mostrar su cabeza y su cola.

inicio :- 
    write("Ingrese una lista de elementos: "), leer(Lista), 
    cabeza(Lista, H), write("La cabeza es: "), write(H),nl,
    cola(Lista, T), write("La cola es: "), write(T).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

cabeza([H|_], H).
cola([_|T], T).