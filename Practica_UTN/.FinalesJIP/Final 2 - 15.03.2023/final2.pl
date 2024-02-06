/*
    - vehiculos(Marca, Precio, Tipo, Estado, [Caracteristicas]).
    - caracteristicas(CodCaracter, Descripcion).

    1) Ingresar dos Precios (max y min) y una lista de codigos de caracteristicas 
    y mostrar toda la info de los autos que tienen esas caracteristicas y estan entre ese precio.
    
    2) En el segundo punto te pedía que ingreses solo una característica y un estado 
    y cuentes cuantos autos cumplían. 
    
    En ninguno de los dos pedía armar listas.
*/

:- dynamic vehiculos/5.
:- dynamic caracteristicas/2.
:- discontiguous opcion/1.

abrir_base :-
    retractall(vehiculos(_,_,_,_,_)),
    retractall(caracteristicas(_,_)),
    consult('final2.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Mostrar info autos con caracteristicas y dentro de ese precio.'),
    writeln('Opcion 2 - Autos que cumplen una caracteristica y un estado'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

opcion(1) :-
    write('Ingrese un precio max: '), read(Max),
    write('Ingrese un precio min: '), read(Min),
    write('Ingrese una lista de caracteres: '), leer(ListaCaract),
    buscar_autos(Max, Min, ListaCaract).

    buscar_autos(_, _, []).
    buscar_autos(Max, Min, ListaCaract) :-
        vehiculos(Marca, Precio, Vehiculo, Estado, ListaCodigos),
        pertenece_lista(ListaCaract, ListaCodigos),
        Precio > Min,
        Precio < Max,
        retract(vehiculos(Marca, Precio, Vehiculo, Estado, ListaCodigos)),
        write('Marca: '), write(Marca), nl,
        write('Precio del vehiculo: '), write(Precio), nl,
        write('Vehiculo: '), write(Vehiculo), nl,
        write('Estado: '), write(Estado), nl, nl,
        buscar_autos(Max, Min, ListaCaract).

    leer([H|T]) :- read(H), H \= [], leer(T).
    leer([]).

    %! Importante --> Pertence --> si una lista pertenece a otra lista
    pertenece_lista([], _).
    pertenece_lista([H|T], ListaCodigos) :- 
        pertenece(H, ListaCodigos),
        pertenece_lista(T, ListaCodigos).

        pertenece(X, [X|_]).
        pertenece(X, [_|T]) :- pertenece(X,T).

opcion(2) :-
    write('Ingrese una caracteristica (codigo): '), read(CodCaracteristica),
    write('Ingrese un estado: '), read(Estado),
    autos_cumplen(CodCaracteristica, Estado, Cantidad), nl,
    write('Autos que cumplen eso: '), write(Cantidad), nl.

    autos_cumplen(CodCaracteristica, Estado, Cantidad) :-
        vehiculos(_, _, auto, Estado, ListaCaract),
        pertenece(CodCaracteristica, ListaCaract),
        retract(vehiculos(_, _, auto, Estado, ListaCaract)),
        autos_cumplen(CodCaracteristica, Estado, CantAux),
        Cantidad is CantAux + 1.
    autos_cumplen(_,_,0).
