:- dynamic alimentacion/3.
:- dynamic bebida/3.
:- dynamic reproduccion/3. 
:- dynamic horas_suenio/2.

abrir_base:- 
    retractall(alimentacion(_,_,_)), 
    retractall(bebida(_,_,_)), 
    retractall(reproduccion(_,_,_)), 
    retractall(horas_suenio(_,_)),
    consult("db3.txt").

menu:-
    abrir_base,
    write("Opcion 1 - Mostar habitos de un animal en base a su nombre"),nl,
    write("Opcion 2 - Mostrar todos los animales que tienen un habito"),nl,
    write("0 - Salir"),
    nl,
    read(Opcion),
    Opcion\=0,
    opcion(Opcion),
    menu.
menu.


opcion(1):- write("Ingresar nombre de un animal para informar habitos: "), read(Animal), 
    write("Su alimentacion y cantidad es: "), 
        alimentacion(Animal, Comida, Cant), write(Comida), write(" - "), write(Cant), nl,
    write("Su bebida y cantidad es: "), 
        bebida(Animal, Bebida, Cant2), write(Bebida), write(" - "), write(Cant2), nl,
    write("Su epoca y periodo es: "), 
        reproduccion(Animal, Epoca, Periodo), write(Epoca), write(" - "), write(Periodo), nl,
    write("Sus horas de suenio son: "), 
        horas_suenio(Animal, Horas), write(Horas), nl.

    
opcion(2):- write("Ingresar un habito para mostrar los animales que lo tienen: "), 
            read(Habito), 
            write("Habito de alimentacion: "),
            habito_alimentacion(Habito), 
            write("Habito de bebida: "),
            habito_bebida(Habito),
            write("Habito de reproduccion: "),
            habito_reproduccion(Habito),
            write("Habito de suenio: "),
            habito_suenio(Habito).
            

habito_alimentacion(Habito):- 
    alimentacion(Animal, Habito, _), 
    write(Animal), 
    retract(alimentacion(Animal, Habito, _)),
    nl, habito_alimentacion(Habito).
    
habito_alimentacion(_):- write("No hay mas habitos de alimentacion"), nl.

habito_bebida(Habito):- 
bebida(Animal, Habito, _), 
write(Animal), 
retract(alimentacion(Animal, Habito, _)),
nl, habito_bebida(Habito).

habito_bebida(_):- write("No hay mas habitos de bebida"), nl.

habito_reproduccion(Habito):- 
    reproduccion(Animal, Habito, _), 
write(Animal), 
retract(reproduccion(Animal, Habito, _)),
nl, habito_reproduccion(Habito).

habito_reproduccion(_):- write("No hay mas habitos de reproduccion"), nl.

habito_suenio(Habito):- 
    horas_suenio(Animal, Habito), 
    write(Animal), 
    retract(horas_suenio(Animal, Habito)),
    nl, habito_suenio(Habito).
    
habito_suenio(_):- write("No hay mas habitos de suenio"), nl.
