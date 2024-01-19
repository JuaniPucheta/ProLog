% Ingresar una lista y determinar a través de una segunda lista todos los
% elementos que se repiten (sin usar ningun tipo de funcion de prolog).

inicio:- writeln('Ingrese una lista: '), 
    leer(Lista), 
    repetidos(Lista, Repetidos), 
    write('Los elementos repetidos son: '), 
    writeln(Repetidos).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

repetidos([], []).
repetidos([H|T], [H|T2]) :- pertenece(T, H), repetidos(T,T2).
repetidos([_|T], T2):- repetidos(T, T2).

pertenece([H|_], H).
pertenece([_|T], H) :- pertenece(T,H).

%* Otra forma
    % pertenece(X, [X|_]).
    % pertenece(X, [_|T]):- pertenece(X, T).

    % primer_repetido([H|T], H):- pertenece(T, H), write("El primer elemento repetido es: "), writeln(H).
    % primer_repetido([_|T]):- primer_repetido(T).
    % primer_repetido([]):- write("No hay elementos repetidos").