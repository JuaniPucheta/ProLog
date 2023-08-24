/*
Hacer un programa que permita definir las cuentas a pagar del mes (luz,
agua, alquiler, teléfono, cable, supermercado, etc.) de un grupo de
personas. A su vez, deberá permitir ingresar el nombre de una de ellas e
informar de todos sus gastos.
*/

:- dynamic gasto/3.

inicio:- abrir_base, pedirPersona(Persona), menu(Persona).

abrir_base:- consult("ej1.txt").

pedirPersona(Persona):- write("Ingrese el nombre de la persona: "), read(Persona).

menu(Persona):- 
    gasto(Persona, _, G),
    write("Gasto total: "), write(G), nl,
    retract(gasto(Persona, _, G)),
    menu(Persona).

menu(_):- write("Fin de la lista").




    
