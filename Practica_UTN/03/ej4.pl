/*Transformar una cadena en una lista de caracteres*/

inicio:- write("Ingrese una cadena: "),
    read(Cadena),
    atom_length(Cadena, Longitud),
    sub_atom(Cadena, 0, 1, _, Cabeza),
    sub_atom(Cadena, 1, Longitud, _, Cola),
    cadena_a_lista(Cabeza, Cola, Lista),
    write("La lista de caracteres es: "),
    write(Lista).

cadena_a_lista([], []).
cadena_a_lista(Cabeza, Cola, [H|T]) :- [H|_] is Cabeza, [_|T] is Cola.

% unir la linea 5 y 7, hacer longitud-1