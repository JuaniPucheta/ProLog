/*
    Ampliar el ejercicio 1 a través del uso de functores. Por ejemplo:
        gasto(maria, super(coto,500)).
        gasto(omar, tel(fijo,telecom,150)).
        gasto(maria,tel(movil,personal,100)).
    
    a. Ingresar un gasto (por ej. super) e informar todas las personas que tienen dicho gasto.
    b. Informar las personas que tienen un consumo superior a los $150 en un cierto gasto (dato de entrada).
    c. Calcular gasto promedio para una determinada persona (dato de entrada). 
*/

:- dynamic gasto/2.
:- discontiguous opcion/1.  % quitamos warning

abrir_base :- 
    retractall(gasto(_,_)),
    consult('ej4.txt').

guardar_base :- tell('ej4.txt'), listing(gasto), told.

inicio :-
    abrir_base,
    writeln(''),
    writeln('=========================================='),
    writeln('Opcion 1 - Informe por gasto de super/tel'),
    writeln('Opcion 2 - Consumo superior 150 en super/tel'),
    writeln('Opcion 3 - Gasto promedio en super/tel por persona'),
    writeln('Opcion 4 - salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 4,
    opcion(Opcion),
    inicio.
inicio.

opcion(1) :-
    write('Ingrese nombre del gasto: '),
    read(Gasto),
    buscar_gasto(Gasto).

    buscar_gasto(super) :-
        gasto(Persona, super(_,_)),
        writeln(Persona),
        retract(gasto(Persona, super(_,_))),
        buscar_gasto(super).

    buscar_gasto(tel) :-
        gasto(Persona, tel(_,_,_)),
        writeln(Persona),
        retract(gasto(Persona, tel(_,_,_))),
        buscar_gasto(tel).

    buscar_gasto(_) :- write('Fin del listado'), nl.

opcion(2) :-
    write('Ingrese el nombre del gasto: '),
    read(Gasto),
    gasto_superior(Gasto).

    gasto_superior(super) :-
        gasto(Persona, super(_, Monto)),
        Monto > 150, 
        write('Superior a 150: '), write(Persona), write(' con: $'), write(Monto), nl,
        retract(gasto(Persona, super(_, Monto))),
        gasto(Persona, super(_, Monto)).
    
    gasto_superior(tel) :-
        gasto(Persona, tel(_, _, Monto)),
        Monto > 150, 
        write('Superior a 150: '), write(Persona), write(' con: $'), write(Monto), nl,
        retract(gasto(Persona, tel(_, _, Monto))),
        gasto(Persona, tel(_, _, Monto)).

    gasto_superior(_) :- write('Fin del listado > 150'), nl.

opcion(3) :-
    write('Ingrese el nombre de la persona: '),
    read(Persona),
    promedio(Persona, Cantidad, Total),
    Promedio is Total / Cantidad, nl,
    write('El gasto promedio es: '), write(Promedio), nl.

    promedio(Persona, Cantidad, Total) :-
        gasto(Persona, super(_, Monto)),
        retract(gasto(Persona, super(_, Monto))),
        promedio(Persona, CantAux, Subtotal),
        Cantidad is CantAux + 1,
        Total is Subtotal + Monto.

    promedio(Persona, Cantidad, Total) :-
        gasto(Persona, tel(_, _, Monto)),
        retract(gasto(Persona, tel(_, _, Monto))),
        promedio(Persona, CantAux, Subtotal),
        Cantidad is CantAux + 1,
        Total is Subtotal + Monto.

    promedio(_, 0, 0).







