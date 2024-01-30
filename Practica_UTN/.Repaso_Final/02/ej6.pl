%? https://www.youtube.com/watch?v=FfptcMSIGiQ&list=PL26vvpQkACkxh2tNni3pTpJuUhLz5-fZE&index=9  

/*
    Ingresar una lista de números enteros y 
    calcular la diferencia entre el primero y el último de ellos.
*/

inicio :- 
    write("Ingrese una lista de numeros: "), leer([H|T]), 
    ultimo([H|T], Ultimo), 
    Diferencia is Ultimo - H, 
    write("La diferencia es: "), write(Diferencia).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

ultimo([H], H). %* [H] equivale a [H|[]], es una lista de un unico elemento

ultimo([_|T], Ultimo) :- ultimo(T, Ultimo).
    %* desprecio la cabeza, y envio recursivamente la cola. Va sacando la cabeza de la lista, sublista y demas
    %* hasta que se queda con un unico elemento
