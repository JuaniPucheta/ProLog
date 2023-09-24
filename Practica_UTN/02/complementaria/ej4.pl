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
intereses(5, ['basketball', 'matematica', 'kungfu', 'comida china']).

/*
    En una nueva red social UTNook, se tiene la siguiente base de hechos  (la que esta arriba)

    Dos usuarios de UTNook son candidatos a ser amigos cuando tienen al 
    menos 2 intereses en común.
    Construir un programa en PROLOG que permita:
        a. Dados dos usuarios, mostrar una lista con los intereses que tienen en 
        común.
        b. Determinar si dos usuarios son candidatos a ser amigos.
        c. Dados dos usuarios, obtener una lista con todos los intereses de 
        ambos.
        d. Dada una ciudad, obtener una lista con los usuarios que viven en ella 
        (utilizando el predicado findall/3)
*/

% defino los predicados a utilizar
interseccion([], _, []).
interseccion([H|T], L2, [H|R]) :- pertenece(H, L2), interseccion(T, L2, R).
interseccion([_|T], L2, LS) :- interseccion(T, L2, LS).

pertenece(X, [X|_]).
pertenece(X, [_|T]) :- pertenece(X, T).
    
calc_long([], 0).
calc_long([_|T], L) :- 
    calc_long(T, Longitud), 
    L is Longitud + 1.

%? a. Dados dos usuarios, mostrar una lista con los intereses que tienen en comun
intereses_comunes(U1, U2) :-
    usuario(Id1, U1, _),
    usuario(Id2, U2, _),
    intereses(Id1, Intereses1),
    intereses(Id2, Intereses2),
    interseccion(Intereses1, Intereses2, Interseccion),
    write(Interseccion).
    
    
%? b. Determinar si dos usuarios son candidatos a ser amigos
son_candidatos_a_ser_amigos(U1, U2) :-
    usuario(I1, U1, _),
    usuario(I2, U2, _),
    intereses(I1, Intereses1),
    intereses(I2, Intereses2),
    interseccion(Intereses1, Intereses2, Interseccion),
    calc_long(Interseccion, L),
    L >= 2.

%? c. Dados dos usuarios, obtener una lista con todos los intereses de ambos
todos_los_intereses(U1, U2) :-
    usuario(I1, U1, _),
    usuario(I2, U2, _),
    intereses(I1, Intereses1),
    intereses(I2, Intereses2),
    unir(Intereses1, Intereses2, Intereses),
    write(Intereses).

unir([], L, L).
unir([H|T], L2, [H|R]) :- unir(T, L2, R).

%? d. Dada una ciudad, obtener una lista con los usuarios que viven en ella (utilizando findall/3)
usuarios_de(Ciudad) :-
    findall(Usuario, usuario(_, Usuario, Ciudad), Usuarios),
    write('Usuarios de '), write(Ciudad), write(': '), write(Usuarios).


