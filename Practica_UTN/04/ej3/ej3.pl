/*
Desarrollar un programa que permita definir los hábitos de: 
• alimentación (comida, cantidad) 
• bebida (bebida, cantidad) 
• reproducción (época de reproducción, período de gestación) 
• horas de sueño 
de un conjunto de animales de un Zoo. 
Dicha información se guardará en una base de datos. 
El programa, deberá permitir: 
a. Ingresar el nombre de un animal e informar de todos sus hábitos. 
b. Ingresar un hábito e informar todos los animales que lo tienen.
*/


:- dynamic alimentacion/3.
:- dynamic bebida/3.
:- dynamic reproduccion/2. 
:- dynamic horas_suenio/2.

abrir_base:- 
    retractall(alimentacion(_,_,_)), 
    retractall(bebida(_,_,_)), 
    retractall(reproduccion(_,_,_)), 
    retractall(horas_suenio(_,_,_)),
    consult("db3.txt").

menu:-
    abrir_base,
    write("1 - Ingresar nombre de un animal para informar habitos"),nl,
    write("2 - Ingresar un habito para informar los animales que lo tienen"),nl,
    write("0 - Salir"),
    read(Codigo),
    nl,
    Codigo\=0,
    opcion(Codigo),
    menu.
menu.

%a) Ingresar el nombre de un animal e informar de todos sus hábitos.

opcion(1):- write("Ingresar nombre de un animal para informar habitos: "), read(Animal), 
    write("Su alimentacion y cantidad es: "), alimentacion(Animal, Comida, Cant), write(Comida), write(Cant),
    write("Su bebida y cantidad es: "), bebida(Animal, Bebida, Cant2), write(Bebida), write(Cant2),
    write("Su epoca y periodo es: "), reproduccion(Animal, Epoca, Periodo), write(Epoca), write(Periodo),
    write("Sus horas de suenio son: "), horas_suenio(Animal, Horas), write(Horas).


%b) Ingresar un hábito e informar todos los animales que lo tienen.

opcion(2):- write("Ingresar un habito para informar los animales que lo tienen: "), read(Habito), 
    write("Los animales que tienen este habito son: "), 
    (alimentacion(Animal, Habito, _) ; 
    bebida(Animal, Habito, _) ; 
    reproduccion(Animal, Habito, _) ; 
    horas_suenio(Animal, Habito)) , write(Animal), nl, fail.