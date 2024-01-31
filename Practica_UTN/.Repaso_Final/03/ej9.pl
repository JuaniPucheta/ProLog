/*
    Ingresar una cadena, contar e informar el número de veces que
    aparece cada una de las vocales (a, e, i, o, u) y la cantidad de
    veces que aparece cualquier consonante.
*/

inicio :-
    write("Ingrese una cadena: "), read(Cadena),
    contador(Cadena, Va, Ve, Vi, Vo, Vu, Consonantes), nl,
    write("A's: "), write(Va), nl,
    write("E's: "), write(Ve), nl,
    write("I's: "), write(Vi), nl,
    write("O's: "), write(Vo), nl,
    write("U's: "), write(Vu), nl,
    write("Consonantes: "), write(Consonantes), nl.

contador('', 0, 0, 0, 0, 0, 0).

%* Vocales A
contador(Cadena, Va, Ve, Vi, Vo, Vu, Consonantes) :-
    sub_atom(Cadena, 0, 1, _, 'a'),
    sub_atom(Cadena, 1, _, 0, Sub),
    contador(Sub, VocalesA, Ve, Vi, Vo, Vu, Consonantes),
    Va is VocalesA + 1.

%* Vocales E
contador(Cadena, Va, Ve, Vi, Vo, Vu, Consonantes) :-
    sub_atom(Cadena, 0, 1, _, 'e'),
    sub_atom(Cadena, 1, _, 0, Sub),
    contador(Sub, Va, VocalesE, Vi, Vo, Vu, Consonantes),
    Ve is VocalesE + 1.

%* Vocales I
contador(Cadena, Va, Ve, Vi, Vo, Vu, Consonantes) :-
    sub_atom(Cadena, 0, 1, _, 'i'),
    sub_atom(Cadena, 1, _, 0, Sub),
    contador(Sub, Va, Ve, VocalesI, Vo, Vu, Consonantes),
    Vi is VocalesI + 1.

%* Vocales O
contador(Cadena, Va, Ve, Vi, Vo, Vu, Consonantes) :-
    sub_atom(Cadena, 0, 1, _, 'o'),
    sub_atom(Cadena, 1, _, 0, Sub),
    contador(Sub, Va, Ve, Vi, VocalesO, Vu, Consonantes),
    Vo is VocalesO + 1.

%* Vocales U
contador(Cadena, Va, Ve, Vi, Vo, Vu, Consonantes) :-
    sub_atom(Cadena, 0, 1, _, 'u'),
    sub_atom(Cadena, 1, _, 0, Sub),
    contador(Sub, Va, Ve, Vi, Vo, VocalesU, Consonantes),
    Vu is VocalesU + 1.

%* Consonantes
contador(Cadena, Va, Ve, Vi, Vo, Vu, Consonantes) :-
    sub_atom(Cadena, 0, 1, _, _),
    sub_atom(Cadena, 1, _, 0, Sub),
    contador(Sub, Va, Ve, Vi, Vo, Vu, Cons),
    Consonantes is Cons + 1.

    
