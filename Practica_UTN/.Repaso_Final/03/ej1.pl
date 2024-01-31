% Ingresar una cadena de texto y obtener el primer carácter de la misma.

inicio :- 
    write("Ingrese una cadena: "),
    read(C), 
    sub_atom(C, 0, 1, _, Primer), nl,
    write("El primer caracter es: "), write(Primer).
