% Ingresar una lista de elementos y mostrar su primer elemento.

inicio:- write("Ingrese una lista de elementos: "), leer(Lista), 
    primer_elemento(Lista, PrimerElemento), 
    write("El primer elemento de la lista es: "), 
    write(PrimerElemento).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).
primer_elemento([H|_], H). %explicacion: el primer elemento de una lista es la cabeza de la lista.
                            % [H|_] es una lista que tiene como primer elemento a H y como cola a _ (que es una lista vacia).
                            % y el H es el primer elemento de la lista. 