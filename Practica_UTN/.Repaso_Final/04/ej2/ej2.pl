/*
    Hacer un programa que defina una Base de datos de personas de la siguiente forma:
        personas(codigo,nombre).

    1) El programa debe permitir ingresar un código y verificar si el mismo está
    definido en la BBDD. De estarlo deberá informar a quién corresponde.
    2) De lo contrario, deberá solicitar ingresar un nombre y registrar entonces la
    persona en la BBDD. 
*/

:- dynamic personas/2.

abrir_base :- 
    retractall(personas(_,_)),
    consult("ej2.txt").

guardar_base :- tell('ej2.txt'), listing(personas), told.

inicio:-
    abrir_base,
    write("Ingrese un codigo (0 salir): "),
    read(Codigo), 
    Codigo \= 0,
    buscar(Codigo),
    inicio.
inicio.

buscar(Codigo) :-
    personas(Codigo, Persona),
    write('Persona encontrada: '),
    write(Codigo), write(' - '), write(Persona), nl. 

buscar(Codigo) :-
    write("No existe. Ingrese un nombre: "), read(Nombre),
    assert(personas(Codigo, Nombre)),
    guardar_base.
