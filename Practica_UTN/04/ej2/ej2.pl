/*
Hacer un programa que defina una Base de datos de personas de la
siguiente forma:
personas(codigo,nombre).
El programa debe permitir ingresar un código y verificar si el mismo está
definido en la BBDD. De estarlo deberá informar a quién corresponde, de lo
contrario deberá solicitar ingresar un nombre y registrar entonces la
persona en la BBDD. 
*/

:- dynamic personas/2.

inicio:- menu.

abrir_base:- retractall(personas(_,_)),consult("ej2.txt").

menu:-
    abrir_base,
    write("Ingrese un codigo (0 salir): "),
    read(Codigo), 
    Codigo\=0,
    buscar(Codigo),
    menu.
menu.

buscar(Codigo):- 
    personas(Codigo, Nombre), 
    write("El codigo pertenece a "), 
    write(Nombre), nl.

buscar(Codigo):- 
    write("No hay persona con ese codigo. "),
    write("Ingrese un nombre: "), read(Nombre), 
    assert(personas(Codigo, Nombre)),
    guardar_base.

guardar_base:- tell("ej2.txt"), listing(personas), told.


