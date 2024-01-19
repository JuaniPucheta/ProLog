% Ingresar una lista y determinar a través de una segunda lista todos los
% elementos que se repiten (sin usar ningun tipo de funcion de prolog).

inicio:- writeln('Ingrese una lista: '), 
    leer(Lista), 
    repetidos(Lista, Repetidos), 
    write('Los elementos repetidos son: '), 
    writeln(Repetidos).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

pertenece([H|_], H).
pertenece([_|T], H) :- pertenece(T,H).

repetidos([], []).
repetidos([H|T], [H|T2]) :- pertenece(T, H), repetidos(T,T2).
repetidos([_|T], T2):- repetidos(T, T2).

%* Otra forma
    % repetidos([], []).
    % repetidos([H|T], [H|T2]) :- pertenece(H, T), repetidos(T,T2).
        %? (1) el primer H esta instanciado, el segundo no
        %? (2) si el pertenece da true, el primer H se copia en la lista que estoy armando
    % repetidos([_|T], Repetidos):- repetidos(T, Repetidos).
        %? (3) si falla, viene aca. Ignoro la cabeza, envio recursivamente la cola y Repetidos
