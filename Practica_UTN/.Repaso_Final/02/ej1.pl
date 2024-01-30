%? https://www.youtube.com/watch?v=FfptcMSIGiQ&list=PL26vvpQkACkxh2tNni3pTpJuUhLz5-fZE&index=9  

% Ingresar una lista de elementos y mostrarla por pantalla.

inicio :- write("Ingrese una lista: "), leer(Lista), write("La lista es: "), write(Lista).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).