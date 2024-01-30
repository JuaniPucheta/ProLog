%? https://www.youtube.com/watch?v=tZDPYQPJFaI&list=PL26vvpQkACkxh2tNni3pTpJuUhLz5-fZE&index=9

/*
    Ingresar una lista de enteros e informar 
    cuál es el mayor de todos los números.
*/

inicio:- write("Ingrese una lista de numeros enteros: "), 
    leer(Lista),
    mayor(Lista, 0, Mayor),
    write("El mayor es: "), write(Mayor).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

mayor([], Mayor, Mayor).    % variable de resguardo

mayor([H|T], MayorMomento, Mayor) :- 
    H >= MayorMomento, 
    mayor(T, H, Mayor). %* reemplaza el `Mayor hasta el momento` por la cabeza

mayor([_|T], MayorMomento, Mayor) :-
    mayor(T, MayorMomento, Mayor).
    %* descarto ese H para continuar por el siguiente elemento