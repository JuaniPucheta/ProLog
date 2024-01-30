% Ingresar una lista y determinar el primer elemento que se repite.

inicio:- writeln('Ingrese una lista de numeros: '), 
    leer(Lista),
    primer_repetido(Lista).

leer([H|T]):- read(H), H \= [], leer(T).
leer([]).

pertenece(X, [X|_]).
pertenece(X, [_|T]):- pertenece(X, T).

primer_repetido([H|T]):- pertenece(H, T), write("El primer elemento repetido es: "), writeln(H).
primer_repetido([_|T]):- primer_repetido(T).
primer_repetido([]):- write("No hay elementos repetidos").
