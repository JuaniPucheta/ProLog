inicio:- write("Ingrese una lista de elementos: "), 
    leer(Lista), 
    write("Elemento a buscar: "), 
    read(X), 
    pertenece(X,Lista).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

%pertenece(X,[]):-write(X), write("No pertenece a la lista").
    % la sacamos pq si no pertenece de igual manera devuelve TRUE y lo q busco es false si no pertenece

pertenece(X,[X|_]). %? esta es la forma de hacer X=X
    %TODO --> cuando la lista es vacia, retorna un fallo por fin de dato. Ya esto es la condicion de fin
    %:-write("Si pertenece a la lista").
pertenece(X,[_|T]):-pertenece(X,T). %! Esto es para el ejercicio 14
