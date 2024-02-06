/*
    - Paciente (dni, nombre,obra social)
    - Profesional(dni,nombre,especialidad,obra social)
    - Turno(dnipaciente,dniprofesional,especialidad,fecha,obra social,monto)
    
    1. Ingresar nombre de paciente y año y listar todas las especialidades 
    SIN REPETIR en que se había atendido ese paciente en ese año. 
    
    2. Mostrar de todos los profesionales de la bbdd, el nombre y la cantidad de turnos
    donde el monto fuera mayor a 1500.
*/

:- dynamic paciente/3.
:- dynamic profesional/4.
:- dynamic turno/6.
:- discontiguous opcion/1.

abrir_base :-
    retractall(paciente(_,_,_)),
    retractall(profesional(_,_,_,_)),
    retractall(turno(_,_,_,_,_,_)),
    consult('final1.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Listar especialidades de un paciente en un año'),
    writeln('Opcion 2 - Cantidad de turnos de un profesional'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

%* Sin lista
%  opcion(1) :- 
%     write('Ingrese un paciente: '), read(Paciente),
%     write('Ingrese un anio: '), read(Anio),
%     listar_especialidades(Paciente, Anio).

%     listar_especialidades(Paciente, Anio) :-
%         paciente(Dni, Paciente, _),
%         turno(Dni, _, Especialidad, Anio, _, _), nl,
%         write('Especialidad: '), write(Especialidad), nl,
%         retract(paciente(Dni, Paciente, _)),
%         retract(turno(Dni, _, Especialidad, Anio, _, _)),
%         listar_especialidades(Paciente, Anio).
%     listar_especialidades(_,_,[]).

%* Con lista - `juan` y `2023`
opcion(1) :-
    write('Ingrese un paciente: '), read(Paciente),
    write('Ingrese un anio: '), read(Anio),
    listar_especialidades(Paciente, Anio, ListaEspecialidades),
    write('Especialidades de ese paciente para es anio: '), write(ListaEspecialidades), nl.

    listar_especialidades(Paciente, Anio, [Especialidad|T]) :-
        paciente(Dni, Paciente, _),
        turno(Dni, _, Especialidad, Anio, _, _),
        retract(turno(Dni, _, Especialidad, Anio, _, _)),
        listar_especialidades(Paciente, Anio, T),
        not(pertenece(Especialidad, T)).
    listar_especialidades(_,_,[]).

        pertenece(X, [X|_]).
        pertenece(X, [_|T]) :- pertenece(X, T).

opcion(2) :-
    buscar_cantidad_turnos.

    buscar_cantidad_turnos :-
        profesional(DniProf, NombreProf, _, _),
        calcularCantidadTurnos(DniProf, Cantidad),
        retract(profesional(DniProf, NombreProf, _, _)), nl,
        write('Profesional: '), write(NombreProf), nl,
        write('Cantidad de turnos: '), write(Cantidad),
        buscar_cantidad_turnos.
    buscar_cantidad_turnos.

    calcularCantidadTurnos(DniProf, Cantidad) :-
        turno(_, DniProf, _, _, _, Monto),
        Monto > 1500,
        retract(turno(_, DniProf, _, _, _, Monto)),
        calcularCantidadTurnos(DniProf, CantAux),
        Cantidad is CantAux + 1.
    calcularCantidadTurnos(_, 0).


    

