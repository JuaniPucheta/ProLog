/*Ingresar una cadena de texto y obtener el último carácter de la
misma.*/

inicio:- write("Ingrese una cadena de texto: "),
    read(Cadena),
    sub_atom(Cadena, _, 1, 0, Ultimo),
    write("El ultimo caracter es: "),
    write(Ultimo).
