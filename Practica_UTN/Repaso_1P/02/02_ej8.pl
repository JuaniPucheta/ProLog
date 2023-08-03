% Ingresar una lista de números enteros e informar cuánto da la sumatoria de ellos.

inicio :- write("Ingrese una lista de numeros enteros: "), leer(Lista),
    sumatoria(Lista, Suma),
    write("La sumatoria es: "), write(Suma).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

sumatoria([], 0).
sumatoria([H|T], Suma) :-
    sumatoria(T, Suma1),
    Suma is H + Suma1.