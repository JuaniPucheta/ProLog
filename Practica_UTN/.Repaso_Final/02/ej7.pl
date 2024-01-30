%? https://www.youtube.com/watch?v=FfptcMSIGiQ&list=PL26vvpQkACkxh2tNni3pTpJuUhLz5-fZE&index=9  

% Ingresar una lista de elementos e informar cuántos elementos tiene.

inicio :- 
    write("Ingrese una lista: "), leer(Lista), 
    contar(Lista, Cantidad), nl,
    write("Cantidad de elementos: "), 
    write(Cantidad).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

contar([], 0).
contar([_|T], Cantidad) :- 
    contar(T, CantAux),
    Cantidad is CantAux + 1.
