/*
    Hacer un programa que permita registrar en una Base de Datos recetas
    de cocina. De cada receta se registran los siguientes datos:
        • Código de receta
        • Nombre de la receta
    
    Y por cada ingrediente que contenga la receta:
        • Nombre del ingrediente
        • Cantidad
    
    A su vez, permitir ingresar dos (2) ingredientes e informar de todas las
    recetas (Código y Nombre) que poseen ambos ingredientes.
    
    Por otro lado, para un ingrediente en particular y una cierta cantidad del
    mismo, determinar aquellas recetas que llevan ese ingrediente y superan
    dicha cantidad.
*/

:- dynamic receta/3.
:- discontiguous opcion/1.

abrir_base :- retractall(receta(_,_,_)), consult('ej6.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Informar recetas'),
    writeln('Opcion 2 - Recetas superan cantidad dado ingrediente'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

opcion(1) :-
    write('Ingrese el 1er ingrediente: '), read(I1),
    write('Ingrese el 2do ingrediente: '), read(I2),
    buscar_receta(I1, I2).

    buscar_receta(I1, I2) :-
        recetas(Numero, Receta, ingrediente(I1, _)),
        recetas(Numero, Receta, ingrediente(I2, _)),
        write('Numero de receta: '), write(Numero), nl,
        write('Nombre de la receta: '), write(Receta), nl,
        retract(recetas(Numero, Receta, ingrediente(I1, _))),
        retract(recetas(Numero, Receta, ingrediente(I2, _))),
        buscar_receta(I1, I2).

    buscar_receta(_,_).

opcion(2) :-
    write('Ingrese un ingrediente: '), read(I1),
    write('Ingrese su cantidad: '), read(C1),
    superan_cantidad(I1, C1).

    superan_cantidad(I1, C1) :-
        recetas(_, Receta, ingrediente(I1, CantOriginal)),
        CantOriginal > C1, nl,
        write('La receta: "'), write(Receta), write('" supera la cantidad ingresada'),
        retract(recetas(_, Receta, ingrediente(I1, CantOriginal))),
        superan_cantidad(I1, C1).

    superan_cantidad(_, _).
