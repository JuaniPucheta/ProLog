% Ingresar una lista de números enteros y 
% calcular la diferencia entre el primero y el último de ellos.

inicio :- 
    write("Ingrese una lista de numeros enteros: "), 
    leer(Lista),
    primero(Lista, Primero),
    ultimo(Lista, Ultimo), 
    Diferencia is Ultimo - Primero,
    write("La diferencia entre el primero y el ultimo es: "),
    write(Diferencia).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

primero([H|_], H).  %* [H] = [H|_]

ultimo([H|[]], H).
ultimo([_|T], Ultimo) :- ultimo(T, Ultimo).
