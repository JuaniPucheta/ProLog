/*
    Ingresar una cadena de texto e informar cuántos caracteres tiene.
    En primer lugar haciendo uso del predicado atom_length/2 y en
    una segunda instancia utilizando sub_atom/5 de forma recursiva
*/
%* sub_atom(Cadena, ComienzoCadena, CantidadCaracteres, CantidadCaracteresRestantes, SubCadena)

inicio :- 
    write("Ingrese una cadena de texto: "), read(Cadena),
    atom_length(Cadena, Longitud), nl,
    write("Con atom_length: "), write(Longitud), nl,
    write("Con sub_atom: "), consubatom(Cadena, L2), write(L2).

%? consubatom(Cadena, L2) :- sub_atom(Cadena, 0, _, L2, _). --> esta es una forma pero no es recursiva

consubatom('', 0).
consubatom(Cadena, Longitud2) :-
    sub_atom(Cadena, 1, _, 0, Subca), %* toma todos menos el primero
    consubatom(Subca, Cantidad),
    Longitud2 is Cantidad + 1.

