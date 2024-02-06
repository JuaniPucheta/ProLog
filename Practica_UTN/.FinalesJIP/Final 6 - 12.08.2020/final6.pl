/*
    Se tiene una Base de Datos compuesta por hechos con la siguiente estructura:

    tipo1: 
        Clasificación según el tipo de mercancia a transportar (‘Camión de lona’ / ‘Plataforma abierta’)
    tipo2: 
        Clasificación según Dimensiones (‘2 ejes’ / ‘3 ejes’ / ‘4 ejes’)
    tipo3: 
        Clasificación según Estructura vehículo (‘Rígido’ / ‘Articulado’ / ‘Trailer’ / ‘Tren de carretera’) 

    - [cod_camion]: Lista de códigos de camión que el conductor está habilitado a conducir

    Ejemplo de hechos con datos:
        camion(1553, scania, 2015, N1, 1000, ‘Camión de lona’, ‘2 ejes’, ‘Rígido’).
        conductor(523, ‘Suárez Mario’, 56, ‘Rosario’, [1553,1645,1825]).

    Desarrollar un programa en PROLOG que permita: 
        1) Dada una lista [ ] de códigos de camiones, una marca y modelo, (datos de entrada)
            devolver una nueva lista [ ] con los códigos de camión de la lista ingresada 
            que sean de la marca y modelo indicado.

        2) Dada una lista [ ] de códigos de conductores y un código de camion (datos de entrada), 
            devolver una nueva lista [ ] con los nombres de los conductores de la lista ingresada, 
            que NO están habilitados a conducir el camión indicado.
*/

:- dynamic camion/8.
:- dynamic conductor/5.
:- discontiguous opcion/1.

abrir_base :-
    retractall(camion(_,_,_,_,_,_,_,_)),
    retractall(conductor(_,_,_,_,_)),
    consult('final6.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Listado de camiones de la marca y modelo indicado.'),
    writeln('Opcion 2 - Listado de conductores (nombres) que no estan habilitados a conducir el camion indicado.'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

%? probado con [1,2,3,5,8,9] y `scania` y `2020`
opcion(1) :-
    write('Ingrese un listado de codigos de camiones: '), leer(ListaCamiones),
    write('Ingrese una marca: '), read(Marca),
    write('Ingrese un modelo: '), read(Modelo),
    lista_camiones_particulares(ListaCamiones, Marca, Modelo, ListaNueva), nl,
    write('Los camiones a fines son: '), write(ListaNueva), nl.

    leer([H|T]) :- read(H), H \= [], leer(T).
    leer([]).

    lista_camiones_particulares([CodCamion|T], Marca, Modelo, [CodCamion|T2]) :-
        camion(CodCamion, Marca, Modelo, _, _, _, _, _),
        retract(camion(CodCamion, Marca, Modelo, _, _, _, _, _)),
        lista_camiones_particulares(T, Marca, Modelo, T2).

    lista_camiones_particulares([_|T], Marca, Modelo, T2):-
        lista_camiones_particulares(T, Marca, Modelo, T2).

    lista_camiones_particulares([], _, _, []).

opcion(2) :-
    write('Ingrese una lista de codigos de conductores: '), leer(ListaConductores),
    write('Ingrese un codigo de camion: '), read(CodCamion),
    busca_conductores_no(ListaConductores, CodCamion, NoHabilitados), nl,
    write('Los conductores no habilitados para conducir el camion son: '), write(NoHabilitados), nl.

    busca_conductores_no([], _, []).

    busca_conductores_no([CodConductor|T], CodCamion, [NombreConductor|T2]) :-
        conductor(CodConductor, NombreConductor, _, _, CamionesHabilitados),
        not(pertenece(CodCamion, CamionesHabilitados)),
        retract(conductor(CodConductor, NombreConductor, _, _, CamionesHabilitados)),
        busca_conductores_no(T, CodCamion, T2).

    busca_conductores_no([_|T], CodCamion, T2) :-
        busca_conductores_no(T, CodCamion, T2).

        pertenece(X, [X|_]).
        pertenece(X, [_|T]) :- pertenece(X, T).