/*Ingresar una cadena de texto y obtener el primer carácter de la misma.*/
%* sub_atom(Cadena, ComienzoCadena, CantidadCaracteres, CantidadCaracteresRestantes, SubCadena)

inicio:- write("Ingrese una cadena de texto: "), 
    read(Lista), 
    sub_atom(Lista, 0, 1, _, P),
    write("El primer caracter de la cadena es: "),
    write(P).

