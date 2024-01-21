/*Ingresar una cadena de texto e informar cuántos caracteres tiene.
En primer lugar haciendo uso del predicado atom_length/2 y en
una segunda instancia utilizando sub_atom/5 de forma recursiva*/

inicio:- write("Ingrese una cadena de texto: "),
    read(Cadena),
    atom_length(Cadena, Longitud),
    write("La longitud de la cadena es: "), 
    write(Longitud), nl,
    consubatom(Cadena, Longitud2),
    write("La longitud de la cadena es: "),
    write(Longitud2).

consubatom(Cadena, Longitud2) :- sub_atom(Cadena, 0, Longitud2, 0, _).
consubatom(Cadena, Longitud2) :- Longitud3 is Longitud2 - 1, consubatom(Cadena, Longitud3).

%* Otra forma
    % inicio:- write("Ingrese una cadena de texto: "),
    % read(Cadena),
    % contar_caracteres(C, Cant), write("La longitud de la cadena es: "), write(Cant).

    % contar_caracteres('', 0).
    % contar_caracteres(C, Cant) :- sub_atom(C, 1, _, 0, Sub),
    %                               contar_caracteres(Sub, CantSub),
    %                               Cant is CantSub + 1.