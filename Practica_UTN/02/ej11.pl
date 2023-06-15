% Ingresar una lista de enteros e informar 
% cuál es el mayor de todos los números.

inicio:- write("Ingrese una lista de numeros enteros: "), 
    leer([H|T]), 
    write("El mayor de todos los numeros es: "), 
    mayor(T, H, Mt),    % al reves seria (H, T, Mt)
    write(Mt).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

mayor([], Mt, Mt).
mayor([H|T], Mi, Mt) :- H > Mi, mayor(T, H, Mt).
mayor([_|T], Mi, Mt) :- mayor(T, Mi, Mt).