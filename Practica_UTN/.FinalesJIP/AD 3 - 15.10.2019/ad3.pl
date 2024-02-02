/*
    [IA] Parcial de AD. 15-10-2019 (Práctica)

    - provincia(id_provincia, nombre_provincia)
    - localidad(id_localidad, nombre_localidad, id_provincia)
    - persona(dni_persona, nombre_persona,fecha_nac,salario,id_localidad)
        La fecha en formato dd/mm/aaaa
    - candidato(id_candidato, nombre_candidato)
    - intencion_de_voto(dni_persona,id_candidato)

    1) Lista de las personas nacidas antes del año 1950 de una provincia. 
        (Se leia el nombre de la provincia)

    2) Mostrar el salario promedio de las personas con intencion de voto hacia un candidato 
        ingresado en una provincia (Se leia el nombre de la provincia y el nombre del candidato)
*/

:- dynamic provincia/2.
:- dynamic localidad/3.
:- dynamic persona/5.
:- dynamic candidato/2.
:- dynamic intencion_de_voto/2.
:- discontiguous opcion/1.

abrir_base :-
    retractall(provincia(_,_)),
    retractall(localidad(_,_,_)),
    retractall(persona(_,_,_,_,_)),
    retractall(candidato(_,_)),
    retractall(intencion_de_voto(_,_)),
    consult('ad3.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Personas nacidas antes de 1950 de una provincia.'),
    writeln('Opcion 2 - Salario promedio de las personas con intencion de voto hacia un candidato.'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

opcion(1) :-
    write('Ingrese una provincia: '), read(NombreProvincia),
    busca_personas(NombreProvincia, ListaPersonas),
    write('Personas nacidas antes de 1950: '), write(ListaPersonas), nl.

    busca_personas(NombreProvincia, [H|T]) :-
        provincia(IdProvincia, NombreProvincia),
        localidad(IdLocalidad, _, IdProvincia),
        persona(_, H, Fecha, _, IdLocalidad),
        sub_atom(Fecha, _, 4, 0, FechaAnio),
        atom_number(FechaAnio, AnioInteger),
        AnioInteger < 1950,
        retract(persona(_, H, Fecha, _, IdLocalidad)),
        busca_personas(NombreProvincia, T).
    busca_personas(_, []).

%? Fue probado con 'Buenos Aires' y 'Juan', salario promedio: 2000 (Juan+Pedro+Jose) 
opcion(2) :-
    write('Ingrese el nombre de la provincia: '), read(NombreProvincia),
    write('Ingrese el nombre del candidato: '), read(NombreCandidato),
    provincia(IdProvincia, NombreProvincia),
    candidato(IdCandidato, NombreCandidato),
    calcular_salario_promedio(IdProvincia, IdCandidato, Contador, Total),
    Promedio is Total / Contador,
    write('Salario promedio: '), write(Promedio), nl.

    calcular_salario_promedio(IdProvincia, IdCandidato, Contador, Total) :-
        localidad(IdLocalidad, _, IdProvincia),
        retract(localidad(IdLocalidad, _, IdProvincia)),
        persona(Dni, _, _, Salario, IdLocalidad),
        retract(persona(Dni, _, _, Salario, IdLocalidad)),
        intencion_de_voto(Dni, IdCandidato),
        calcular_salario_promedio(IdProvincia, IdCandidato, ContAux, Subtotal),
        Contador is ContAux + 1,
        Total is Subtotal + Salario.
    calcular_salario_promedio(_,_,0,0).
