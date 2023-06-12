% Ingresar una lista de números enteros e informar cuánto da la sumatoria de ellos.

inicio :- write("Ingrese una lista de numeros enteros: "), leer(Lista),
    sumatoria(Lista, Sumatoria), 
    write("La sumatoria de los numeros ingresados es: "), 
    write(Sumatoria).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

sumatoria([], 0).   
sumatoria([H|T], Sumatoria) :- 
    sumatoria(T, Sumatoria1),  
    Sumatoria is H + Sumatoria1. 
