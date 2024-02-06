/*
    - personas(Nombre, Edad, [Profesiones],Ciudad).
    - cursos(Profesion, [Cursos]).
    - personas_cursos(Nombre,Profesion,[CursosRealizados]).

    1) Ingresar una profesión (dato de entrada), 
        y mostar la edad promedio de dicha profesion en la ciudad de Rosario.
    2) Ingresar una profesión (dato de entrada), 
        y mostrar para cada persona, la lista de cursos que le faltan realizar.
    3) Mostrar la profesión con mayor cantidad de cursos
*/

:- dynamic personas/4.
:- dynamic cursos/2.
:- dynamic personas_cursos/3.
:- discontiguous opcion/1.

abrir_base :-
    retractall(personas(_,_,_,_)),
    retractall(cursos(_,_)),
    retractall(personas_cursos(_,_,_)),
    consult('final8.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Edad promedio dada una profesion en Rosario.'),
    writeln('Opcion 2 - Lista de cursos por persona que faltan realizar.'),
    writeln('Opcion 3 - Profesion con mayor cantidad de cursos.'),
    writeln('Opcion 4 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 4,
    opcion(Opcion),
    inicio.
inicio.

opcion(1) :-
    write('Ingrese una profesion: '), read(Profesion), nl,
    edad_promedio_profesion(Profesion, Cantidad, Total),
    Promedio is Total / Cantidad,
    write('Edad promedio: '), write(Promedio), nl.

    edad_promedio_profesion(Profesion, Cantidad, Total) :-
        personas(_, Edad, ListaProfesiones, 'rosario'),
        pertenece(Profesion, ListaProfesiones),
        retract(personas(_, Edad, ListaProfesiones, _)),
        edad_promedio_profesion(Profesion, CantAux, Subtotal),
        Cantidad is CantAux + 1,
        Total is Subtotal + Edad.
    edad_promedio_profesion(_, 0, 0).

        pertenece(X, [X|_]).
        pertenece(X, [_|T]) :- pertenece(X, T).

opcion(2) :-
    write('Ingrese una profesion: '), read(Profesion), nl,
    busca_cursos(Profesion).

    busca_cursos(Profesion) :-
        cursos(Profesion, Cursos),
        personas_cursos(Persona, Profesion, CursosRealizados),
        armar_lista_faltante(Cursos, CursosRealizados, Faltantes), nl,
        retract(personas_cursos(Persona, Profesion, CursosRealizados)),
        write('Cursos que faltan realizar a '), write(Persona), write(': '), write(Faltantes), nl,
        busca_cursos(Profesion).
    busca_cursos(_).

        armar_lista_faltante([H|T], CursosRealizados, [H|T1]) :-
            not(pertenece(H, CursosRealizados)),
            armar_lista_faltante(T, CursosRealizados, T1).

        armar_lista_faltante([_|T], CursosRealizados, T1) :-
            armar_lista_faltante(T, CursosRealizados, T1).

        armar_lista_faltante([], _, []).

%TODO --> consultar
opcion(3) :-
    profesion_con_mas_cursos(Profesion, Cantidad), nl,
    write('Profesion: '), write(Profesion), write(' - cursos: '), write(Cantidad), nl.

    profesion_con_mas_cursos(Profesion, Cantidad) :-
        cursos(Profesion, Cursos),
        conteo(Cursos, CantAux),
        retract(cursos(Profesion, Cursos)),
        profesion_con_mas_cursos(Profesion, CantAux),
        CantAux > Cantidad,
        Cantidad is CantAux.
    profesion_con_mas_cursos(_, 0).

        conteo([], 0).
        conteo([_|T], CantAux) :-
            conteo(T, Aux),
            CantAux is Aux + 1.

% opcion(3) :-
%     profesion_con_mas_cursos(Profesion, 0, Mayor), nl,
%     write('Profesion: '), write(Profesion), write(' - cursos: '), write(Mayor), nl.

%     profesion_con_mas_cursos(_, Mayor, Mayor).
%     profesion_con_mas_cursos(Profesion, MHM, Mayor) :-
%         cursos(Profesion, Cursos),
%         conteo(Cursos, Contador),
%         retract(cursos(Profesion, Cursos)),
%         Contador > MHM,
%         profesion_con_mas_cursos(Profesion, Contador, Mayor).

%         conteo([], 0).
%         conteo([_|T], Contador) :-
%             conteo(T, ContAux),
%             Contador is ContAux + 1.