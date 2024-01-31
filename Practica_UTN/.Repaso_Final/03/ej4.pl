% Transformar una cadena en una lista de caracteres

%* sub_atom(Cadena, ComienzoCadena, CantidadCaracteres, CantidadCaracteresRestantes, SubCadena)

inicio:- write("Ingrese una cadena: "), 
    read(Cadena), 
    transformar(Cadena, Lista), 
    write(Lista).

transformar('', []).
transformar(Cadena, [H|T]) :-
    sub_atom(Cadena, 0, 1, _, H),       %* mando la cabeza
    sub_atom(Cadena, 1, _, 0, Resto),   %* mando el resto como Cola y llamo a recursividad
    transformar(Resto, T).

