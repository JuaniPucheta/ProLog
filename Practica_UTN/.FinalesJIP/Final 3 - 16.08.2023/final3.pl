/*
    - unidades(NroUnidad, Marca, Modelo).
    - viajes(NroUnidad, Costo).
    
    1) Calcular Total de Viajes para cada Unidad.
    2) Segun lista de Unidades ingresadas, lista las que tengan Viajes mayores a 5000.
*/

:- dynamic unidades/3.
:- dynamic viajes/2.
:- discontiguous opcion/1.

abrir_base :-
    retractall(unidades(_,_,_)),
    retractall(viajes(_,_)),
    consult('final3.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Total de viajes para cada unidad.'),
    writeln('Opcion 2 - Listar unidades que tengan viajes mayores a 5000.'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

%! Importante --> aprender este tipo de Contador en donde hago un metodo general y lo llamo varias veces 
opcion(1) :-
    calcular_cant_viajes.

    calcular_cant_viajes:-
        unidades(NroUnidad, _, _),
        cant_viajes(NroUnidad, Cantidad),
        retract(unidades(NroUnidad, _, _)),
        write('Unidad: '), write(NroUnidad), write(', viajes: '), write(Cantidad), nl,
        calcular_cant_viajes.
    calcular_cant_viajes.

    cant_viajes(NroUnidad, Cantidad) :-
        viajes(NroUnidad, _),
        retract(viajes(NroUnidad, _)),
        cant_viajes(NroUnidad, CantAux),
        Cantidad is CantAux + 1.
    cant_viajes(_, 0).

%! Importante --> estudiar esto, armar una nueva lista en base a otra con filtro
opcion(2) :-
    write('Ingrese una lista de unidades: '), leer(ListaUnidades),
    listar_unidades(ListaUnidades, NuevaLista),
    write('Unidades con viajes > 5000: '), write(NuevaLista), nl.
    
    leer([H|T]) :- read(H), H \= [], leer(T).
    leer([]).
    
    listar_unidades([], []).

    listar_unidades([H|T1], [H|T2]) :-
        unidades(H, _, _),
        calcular_costo(H, Total),
        Total > 5000,
        retract(unidades(H, _, _)),
        listar_unidades(T1, T2).

    listar_unidades([_|T1], T2) :-
        listar_unidades(T1, T2).

        calcular_costo(H, Total) :-
            viajes(H, Costo),
            retract(viajes(H, Costo)),
            calcular_costo(H, Subtotal),
            Total is Subtotal + Costo.
        calcular_costo(_, 0).
