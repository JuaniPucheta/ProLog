/* 
    Ingresar una cadena y un carácter, luego informar la cantidad de
    veces que aparece dicho carácter en la cadena. 
*/

inicio :-
    write("Ingrese una cadena: "), read(Cadena),
    write("Ingrese un caracter: "), read(Caracter),
    buscador(Cadena, Caracter, Contador), nl,
    write("Aparece tantas veces: "), write(Contador).

buscador('', _, 0).

buscador(Cadena, Caracter, Contador) :-
    sub_atom(Cadena, P, _, _, Caracter),
    Pos is P + 1,
    atom_length(Cadena, Largo),
    CantRest is Largo - Pos,
    sub_atom(Cadena, Pos, CantRest, _, Sub),
    buscador(Sub, Caracter, Cont),
    Contador is Cont + 1.
