% Ingresar una lista de números enteros e informar cuánto da la sumatoria de ellos.

inicio :- 
    write("Ingrese una lista de numeros enteros: "), leer(Lista),
    suma(Lista, Suma), nl,
    write("La suma es: "), write(Suma).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

suma([], 0).
suma([H|T], Suma) :- 
    suma(T, SumaAux),
    Suma is H + SumaAux.

%? En el `CONTAR` --> despreciaba la cabeza y sumaba uno. Es un contador.
%? En la `SUMA` --> sumo la cabeza de la lista. Es un acumulador