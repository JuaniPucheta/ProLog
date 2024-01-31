/*
    Hacer un programa que permita definir las cuentas a pagar del mes (luz,
    agua, alquiler, teléfono, cable, supermercado, etc.) de un grupo de
    personas. A su vez, deberá permitir ingresar el nombre de una de ellas e
    informar de todos sus gastos.
*/

:- dynamic gasto/3.
:- discontiguous opcion/1.  % quitamos warning

abrir_base :- 
    retractall(gasto(_,_,_)), 
    consult("ej1.txt").

inicio :- 
    abrir_base, nl,
    writeln("1 - Gastos del grupo de personas."),
    writeln("2 - Gastos de una persona"),
    writeln("0 - salir"), nl,
    read(Opcion), nl,
    Opcion \= 0,
    opcion(Opcion),
    inicio.
inicio.

%* Gastos del grupo de personas CON FAIL
opcion(1) :-
    gastos_general.

    gastos_general :-
        gasto(Persona, _, Gasto),
        write(Persona), write(" - "), write(Gasto), nl,
        fail.

%* Gastos del gurpo de personas CON RETRACT
    % gastos_general :-
    %     gasto(Persona, _, Gasto),
    %     write(Persona), write(" - "), write(Gasto), nl,
    %     retract(gasto(Persona, _, Gasto)),
    %     gastos_general.
    % gastos_general.

    
%* Gastos del grupo de una persona 
opcion(2):- 
    write('Ingrese el nombre de una persona: '),
    read(Persona),
    gastos_persona(Persona).
    
    gastos_persona(Persona):- 
        gasto(Persona, Servicio, Gasto), nl,
        write(Persona), write(" - "), write(Servicio), write(" - "), write(Gasto), nl,
        retract(gasto(Persona, Servicio, Gasto)),
        gastos_persona(Persona).
    gastos_persona(_) :- nl, write('Fin lista de gastos.').
    




