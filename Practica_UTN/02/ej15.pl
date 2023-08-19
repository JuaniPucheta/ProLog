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