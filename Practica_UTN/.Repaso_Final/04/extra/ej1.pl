/*
    1. Dada una ciudad, obtener una lista [] con los usuarios que viven en ella
    (no utilizar el predicado findall/3 que vieron en los ejercicios
    complementarios de la práctica 2).

    2. Dado un usuario informar cuantos son sus intereses.

    3. Dado un determinado interés, informar cuantos usuarios lo tienen.

    4. Dada una lista [] de usuarios y un interés, informar a través de una
    nueva lista [] aquellos usuarios que tienen dicho interés.
*/

:- dynamic usuario/3.
:- dynamic intereses/2.
:- discontiguous opcion/1.

abrir_base :- 
    retractall(usuario(_,_,_)), 
    retractall(intereses(_,_)), 
    consult('ej1.txt').

inicio :-
    abrir_base,
    writeln('=========================================='),
    writeln('Opcion 1 - Lista de usuarios que viven en una ciudad'),
    writeln('Opcion 2 - Intereses de un usuario'),
    writeln('Opcion 3 - Cantidad de usuarios con determinado interes'),
    writeln('Opcion 4 - Usuarios que tienen un interes'),
    writeln('Opcion 5 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 5,
    opcion(Opcion),
    inicio.
inicio.

% pertenece(X, [X|_]).
% pertenece(X, [_|T]) :- pertenece(X, T).

opcion(1) :-
    write('Ingrese una ciudad: '), read(Ciudad),
    lista_usuarios(Ciudad, Lista),
    write('Usuarios que viven en una ciudad: '), write(Lista), nl.

    lista_usuarios(Ciudad, [H|T]) :-
        usuario(_, H, Ciudad),
        retract(usuario(_, H, Ciudad)),
        lista_usuarios(Ciudad, T).
    lista_usuarios(_, []).

opcion(2) :-
    write('Ingrese un usuario para saber sus intereses: '), read(Usuario),
    usuario(Nro, Usuario, _),
    intereses(Nro, Intereses),
    cantidad_intereses_usuario(Intereses, Cantidad), nl,
    write('La cantidad es: '), write(Cantidad), nl.

    cantidad_intereses_usuario([_|T], Cantidad) :-
        cantidad_intereses_usuario(T, Cant),
        Cantidad is Cant + 1.
    cantidad_intereses_usuario([], 0).

opcion(3) :-
    write('Ingrese un interes: '), read(Interes),
    usuarios_cantidad_nombres(Interes, Cantidad, Lista), nl,
    write('Usuarios con ese interes: '), write(Cantidad), write(' - '), write(Lista), nl.

    pertenece(X, [X|_]).
    pertenece(X, [_|T]) :- pertenece(X, T).

    usuarios_cantidad_nombres(Interes, Cantidad, [H|T]) :-
        intereses(Nro, Intereses),
        pertenece(Interes, Intereses),
        usuario(Nro, H, _),
        retract(intereses(Nro, Intereses)),
        retract(usuario(Nro, H, _)),
        usuarios_cantidad_nombres(Interes, CantAux, T),
        Cantidad is CantAux + 1.
    usuarios_cantidad_nombres(_, 0, []).


%TODO --> consultar (no se guarda la `Lista`, da []) 
opcion(4) :-
    write('Ingrese una lista de usuarios: '), leer(Lista),
    write('Ingrese un interes: '), read(Interes),
    usuarios_con_interes(Lista, Interes, L2), nl,
    write('Lista de usuarios con ese interes: '), write(L2), nl.

    leer([H|T]) :- read(H), H \= [], leer(T).
    leer([]).

    usuarios_con_interes([], _, []).

    usuarios_con_interes([H|T], Interes, [H|T2]) :-
        intereses(Nro, Intereses),
        pertenece(Interes, Intereses),
        usuario(Nro, H, _),
        usuarios_con_interes(T, Interes, T2).

    usuarios_con_interes([_|T], Interes, T2) :- 
        usuarios_con_interes(T, Interes, T2).

    % interseccion([H|T], L2, [H|L3]) :- pertenece(H, L2), interseccion(T, L2, L3).
    % interseccion([_|T], L2, L3) :- interseccion(T, L2, L3).