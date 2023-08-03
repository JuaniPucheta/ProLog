% Ingresar una lista y un elemento e informar si ese elemento está en la lista

inicio:- write("Ingrese una lista de elementos: "), 
    leer(Lista), 
    write("Elemento a buscar: "), 
    read(X), 
    pertenece(X,Lista).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

pertenece(X,[X|_]). %? esta es la forma de hacer X=X
                    %? cuando la lista es vacia, retorna un fallo por fin de dato. Ya esto es la condicion de fin
pertenece(X,[_|T]) :- pertenece(X,T). 