/*
    Desarrollar un programa que permita definir los hábitos de:
        • alimentación (animal, comida, cantidad)
        • bebida (animal, bebida, cantidad)
        • reproducción (animal, época de reproducción, período de gestación)
        • horas de sueño (animal, horas)
    de un conjunto de animales de un Zoo.
    
    Dicha información se guardará en una base de datos.
    
    El programa, deberá permitir:
        a. Ingresar el nombre de un animal e informar de todos sus hábitos.
        b. Ingresar un hábito e informar todos los animales que lo tienen. 
*/

:- dynamic alimentacion/3.
:- dynamic bebida/3.
:- dynamic reproduccion/3.
:- dynamic horas_suenio/2.

abrir_base :- 
    retractall(alimentacion(_,_,_)),
    retractall(bebida(_,_,_)),
    retractall(reproduccion(_,_,_)),
    retractall(horas_suenio(_,_)),
    consult('ej3.txt').

inicio :-
    abrir_base, nl,
    write('Opcion 1 - Habitos de un animal'), nl,
    write('Opcion 2 - Animales que tienen X habito'), nl,
    write('Opcion 0 - Salir'), nl,
    read(Opcion),
    Opcion \= 0,
    opcion(Opcion),
    inicio.
inicio.

opcion(1) :-
    write('Ingrese el nombre de un animal: '), read(Animal), nl,
    
    alimentacion(Animal, Comida, Cantidad),
        write('Comida y cantidad: '), write(Comida), write(' - '), write(Cantidad), nl,
    bebida(Animal, Bebida, _),
        write('Bebida: '), write(Bebida), nl,
    reproduccion(Animal, Mes, Gestacion),
        write('Mes de reproduccion y gestacion: '), write(Mes), write(' - '), write(Gestacion), nl,
    horas_suenio(Animal, Horas),
        write('Horas suenio: '), write(Horas), nl.

opcion(2) :-
    write('Ingrese un habito: '), read(Habito),
    write("Habito de alimentacion."), nl, habito_alimentacion(Habito),
    write("Habito de bebida."), nl, habito_bebida(Habito),
    write("Habito de reproduccion."), nl, habito_reproduccion(Habito),
    write("Habito de suenio."), nl, habito_suenio(Habito).

habito_alimentacion(Habito) :-
    alimentacion(Animal, Habito, _),
    write('Animal con mismo habito: '), write(Animal), nl,
    retractall(alimentacion(Animal, Habito, _)),
    habito_alimentacion(Habito).
habito_alimentacion(_) :- write('No hay mas animales con este habito'), nl.

habito_bebida(Habito) :-
    bebida(Animal, Habito, _),
    write('Animal con mismo habito: '), write(Animal), nl,
    retractall(bebida(Animal, Habito, _)),
    habito_bebida(Habito).
habito_bebida(_) :- write('No hay mas animales con este habito'), nl.

habito_reproduccion(Habito) :-
    reproduccion(Animal, Habito, _),
    write('Animal con mismo habito: '), write(Animal), nl,
    retractall(reproduccion(Animal, Habito, _)),
    habito_reproduccion(Habito).
habito_reproduccion(_) :- write('No hay mas animales con este habito'), nl.

habito_suenio(Habito) :-
    horas_suenio(Animal, Habito),
    write('Animal con mismo habito: '), write(Animal), nl,
    retractall(horas_suenio(Animal, Habito)),
    habito_suenio(Habito).
habito_suenio(_) :- write('No hay mas animales con este habito'), nl.
