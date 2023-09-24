:- dynamic recetas/3.
:- discontiguous opcion/1.  % quitamos warning

abrir_base:- 
    retractall(recetas(_,_,_,_)), 
    consult("db6.txt").

menu:- 
    abrir_base, nl,
    write("Opcion 1 - Informar recetas"), nl,
    write("Opcion 2 - Recetas superan cantidad"), nl,
    write("Opcion 0 - Salir "),
    nl,
    read(Opcion),
    Opcion\=0,
    opcion(Opcion),
    menu.
menu.

opcion(1):-
    write("Ingrese el ingrediente 1: "),
    read(I1),
    write("Ingrese el ingrediente 2: "),
    read(I2),
    buscar_receta(I1, I2).

buscar_receta(I1, I2):- 
    recetas(Nro, Nombre, ingrediente(I1, _)),   
    recetas(Nro, Nombre, ingrediente(I2, _)),   
    write("Numero de receta: "), write(Nro), nl,
    write("Nombre de receta: "), write(Nombre), nl, nl,
    retract(recetas(Nro, Nombre, ingrediente(I1, _))),
    retract(recetas(Nro, Nombre, ingrediente(I2, _))),
    buscar_receta(I1, I2).

buscar_receta(_, _):- !.

opcion(2):-
    write("Ingrese un ingrediente: "),
    read(I1),
    write("Ingrese su cantidad: "),
    read(C1),
    superan_cantidad(I1, C1).

superan_cantidad(I1, C1):-
    recetas(_, Nombre, ingrediente(I1, C)),
    C>C1,
    write("Nombre de receta: "), write(Nombre), nl, nl,
    retract(recetas(_, Nombre, ingrediente(I1, C))),
    superan_cantidad(I1, C1).

superan_cantidad(_, _):- !.

