/*
    - jardin(CodigoJardin, [Tipos de Sala])
    - salas(CodigoJardin, tipo_de_sala, [Dni Asistentes])
    
    1) Dada una Lista [] de Dni, y un Codigo de Jardin 
        Devolver una Lista [] con aquellos Dni que asisten realmente al Jardin.
    2 - Dada una Lista [] de Jardines, y una Lista [] de Tipos de Sala, 
        devolver una Lista [] con los Jardines que tengan todos los tipos de sala.
*/

:- dynamic jardin/2.
:- dynamic salas/3.
:- discontiguous opcion/1.

abrir_base :-
    retractall(jardin(_,_)),
    retractall(salas(_,_,_)),
    consult('final9.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Lista de Dni que asisten al jardin.'),
    writeln('Opcion 2 - Lista de jardines que tengan las salas ingresadas.'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

opcion(1) :-
    write('Ingrese una lista de dni: '), leer(ListaDni),
    write('Ingrese codigo de jardin: '), read(CodigoJardin),
    buscar_dnis(ListaDni, CodigoJardin, Asistentes), nl,
    write('Dnis que asisten: '), write(Asistentes), nl.

    leer([H|T]) :- read(H), H \= [], leer(T).
    leer([]).

    pertenece(X, [X|_]).
    pertenece(X, [_|T]) :- pertenece(X, T).

    buscar_dnis([H|T1], CodigoJardin, [H|T2]) :-
        salas(CodigoJardin, _, DniSalas),
        pertenece(H, DniSalas),
        % retract(salas(CodigoJardin, _, DniSalas)),
        buscar_dnis(T1, CodigoJardin, T2).

    buscar_dnis([_|T1], CodigoJardin, T2) :-
        buscar_dnis(T1, CodigoJardin, T2).

    buscar_dnis([], _, []).

opcion(2) :-
    write('Ingrese una lista de jardines: '), leer(ListaJardines),
    write('Ingrese una lista de tipos de sala'), leer(ListaTiposSala),
    lista_jardines_sala(ListaJardines, ListaTiposSala, NuevaLista), nl,
    write('Lista de jardines con todos los tipos de sala: '), 
    write(NuevaLista), nl.

    lista_jardines_sala([], _, []).

    lista_jardines_sala([H|T], ListaTiposSala, [H|T2]) :-
        jardin(H, ListaSalasJardin),
        retract(jardin(H, ListaSalasJardin)),
        pertenece_lista(ListaTiposSala, ListaSalasJardin),
        lista_jardines_sala(T, ListaTiposSala, T2).

    lista_jardines_sala([_|T], ListaTiposSala, T2) :-
        lista_jardines_sala(T, ListaTiposSala, T2).

        pertenece_lista([], _).
        pertenece_lista([H|T], ListaSalasJardin) :-
            pertenece(H, ListaSalasJardin),
            pertenece_lista(T, ListaSalasJardin).
        



