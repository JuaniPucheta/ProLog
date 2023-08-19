% Ingresar una lista y determinar el primer elemento que se repite.

inicio:- writeln('Ingrese una lista de numeros: '), 
    leer([H|T]),
    repite(H,T).

leer([H|T]):- read(H),H\=[],leer(T).
leer([]).

pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).

repite(_,[]):- write("No hay elementos que se repitan").
repite(X,T):- pertenece(X,T), write("El primer elemento que se repite es: "), write(X).
repite(_,[X|T]):- repite(X,T).