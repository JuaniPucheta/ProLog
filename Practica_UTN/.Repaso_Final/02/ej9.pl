%? https://www.youtube.com/watch?v=tZDPYQPJFaI&list=PL26vvpQkACkxh2tNni3pTpJuUhLz5-fZE&index=9

/*
    Ingresar una lista de números enteros y calcular su promedio. 
    Respetar el formato del predicado promedio(L,S,C) 
    donde L es la lista ingresada, S la sumatoria y C el contador de los elementos de la lista.
*/

%! Importante aprender

inicio :- write("Ingrese una lista de numeros: "), leer(Lista),
    promedio(Lista, Suma, Contador), nl,
    Promedio is Suma / Contador,
    write("El promedio es: "), write(Promedio).

leer([H|T]) :- read(H), H\=[], leer(T).
leer([]).

promedio([], 0, 0).
promedio([H|T], Suma, Contador) :-
    promedio(T, S, C),
    Suma is S + H,
    Contador is C + 1.
