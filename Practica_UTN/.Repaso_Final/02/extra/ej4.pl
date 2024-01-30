% usuario(idUsuario, nombre, localidad)
usuario(1, miguel, rosario).
usuario(2, maria, rafaela).
usuario(3, juan, rafaela).
usuario(4, jose, rosario).
usuario(5, mariana, rafaela).

% intereses(idUsuario, [lista intereses])
intereses(1,['natacion','redes neuronales','yoga','comida mexicana']).
intereses(2,['natacion','redes neuronales','yoga','comida mexicana']).
intereses(3, ['futbol', 'comida mexicana', 'peliculas']).
intereses(4, ['futbol', 'comida mexicana', 'peliculas']).
intereses(5, ['basketball', 'natacion', 'kungfu', 'comida china']).

/*
    En una nueva red social UTNook, se tiene la siguiente base de hechos  (la que esta arriba)

    Dos usuarios de UTNook son candidatos a ser amigos cuando tienen al 
    menos 2 intereses en común.
    Construir un programa en PROLOG que permita:
        a. Dados dos usuarios, mostrar una lista con los intereses que tienen en común.
        b. Determinar si dos usuarios son candidatos a ser amigos.
        c. Dados dos usuarios, obtener una lista con todos los intereses de ambos.
        d. Dada una ciudad, obtener una lista con los usuarios que viven en ella 
        (utilizando el predicado findall/3)
*/

pertenece(X, [X|_]).
pertenece(X, [_|T]) :- pertenece(X, T).

interseccion([], _, []).
interseccion(_, [], []).

interseccion([H|T], L2, [H|L3]) :- pertenece(H, L2), interseccion(T, L2, L3).
interseccion([_|T], L2, L3) :- interseccion(T, L2, L3).

calc_nro_intereses([], 0).
calc_nro_intereses([_|T], Cantidad) :-
    calc_nro_intereses(T, Cant),
    Cantidad is Cant + 1.


%* Dados dos usuarios, mostrar una lista con los intereses que tienen en común.
intereses_en_comun(U1, U2) :-
    usuario(Id1, U1, _),
    usuario(Id2, U2, _),
    intereses(Id1, Inte1),
    intereses(Id2, Inte2),
    interseccion(Inte1, Inte2, InteComun),
    write(InteComun).

%* Determinar si dos usuarios son candidatos a ser amigos.
candidatos_amigos(U1, U2) :-
    usuario(Id1, U1, _),
    usuario(Id2, U2, _),
    intereses(Id1, Inte1),
    intereses(Id2, Inte2),
    interseccion(Inte1, Inte2, InteComun),
    calc_nro_intereses(InteComun, Cantidad),
    Cantidad >= 2.

%* Dados dos usuarios, obtener una lista con todos los intereses de ambos.
todos_los_intereses(U1, U2) :-
    usuario(Id1, U1, _),
    usuario(Id2, U2, _),
    intereses(Id1, Inte1),
    intereses(Id2, Inte2),
    unir(Inte1, Inte2, InteComun),
    write(InteComun).

unir(I1, [], I1).
unir([], I2, I2).
unir([], [], []).

unir([H|T], L2, [H|T3]) :- unir(T, L2, T3).

%* d. Dada una ciudad, obtener una lista con los usuarios que viven en ella (utilizando el predicado findall/3)
usuarios_de(Ciudad) :-
    findall(Usuario, (_, Usuario, Ciudad), Usuarios),
    write('Usuarios de: '), write(Ciudad), write(': '), write(Usuarios).
