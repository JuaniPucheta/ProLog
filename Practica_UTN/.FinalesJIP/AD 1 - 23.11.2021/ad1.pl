/*
    - persona(dni,edad,[lista_de_ids_de_vacunas_aplicadas]) 
    - vacuna(id_vacuna,descripcion,[lista_ids_de_enfermedades_que_combate])
    - enfermedad(id_enfermedad,descripcion,[lista_ids_de_sintomas])
    - sintoma(id_sintoma,descripcion)

    1) Informar a traves de una lista 
        aquellas enfermedades de la base de datos que no son combatidas por ninguna de las vacunas.

    2) Informar a traves de una lista
        aquellas vacunas de la base de datos que combaten mas de 5 enfermedades.
*/

:- dynamic vacuna/3.
:- dynamic enfermedad/3.
:- dynamic sintoma/2.
:- discontiguous opcion/1.

abrir_base :-
    retractall(vacuna(_,_,_)),
    retractall(enfermedad(_,_,_)),
    retractall(sintoma(_,_)),
    consult('ad1.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Lista de enfermedades que no son combatidas por vacunas.'),
    writeln('Opcion 2 - Lista de vacunas que combaten +5 enfermedades'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

%TODO --> consultar | asi como esta, trae [covid, delta, lepra], todo bien salvo `delta` 
opcion(1) :- nl,
    listado_enfermedades(Listado),
    write('Enfermedades no combatidas: '), write(Listado), nl.
    
    listado_enfermedades([H|T]) :-
        enfermedad(IdEnfermedad, H, _),
        vacuna(_, _, EnfermedadesQueCombate),
        retract(enfermedad(IdEnfermedad, H, _)),
        retract(vacuna(_, _, EnfermedadesQueCombate)),
        not(pertenece(IdEnfermedad, EnfermedadesQueCombate)),
        listado_enfermedades(T).
    listado_enfermedades([]).

    pertenece(X, [X|_]).
    pertenece(X, [_|T]) :- pertenece(X, T).

opcion(2) :- nl,
    vacunas_combaten.

    vacunas_combaten :-
        vacuna(IdVacuna, Nombre, EnfermedadesQueCombate),
        retract(vacuna(IdVacuna, Nombre, EnfermedadesQueCombate)),
        cuenta_enfermedades(EnfermedadesQueCombate, Contador),
        Contador > 5,
        write('Vacuna +5 enfermedades: '), write(Nombre), nl,
        vacunas_combaten.
    vacunas_combaten.

        cuenta_enfermedades([_|T], Contador) :-
            cuenta_enfermedades(T, ContAux),
            Contador is ContAux + 1.
        cuenta_enfermedades([], 0).