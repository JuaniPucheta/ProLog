% Ingresar una lista de enteros e informar cuál es el menor de todos los números.

%! Importante aprender

inicio:- write('Ingrese una lista de enteros: '), 
    % leer(Lista), 
    % menor(Lista, 0, Menor), 
        %? ^^^ No puedo usar lo de arriba porque toma el 0 siempre como el menor
        %? Tengo que usar la Lista descompuesta en [H|T]

    leer([H|T]), 
    menor([H|T], H, Menor), 
    write('El menor de todos los numeros es: '), 
    write(Menor).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

menor([], Menor, Menor).    %* variable de resguardo

menor([H|T], MenorMomento, Menor) :-
    H < MenorMomento,
    menor(T, H, Menor).

menor([_|T], MenorMomento, Menor) :-
    menor(T, MenorMomento, Menor).
