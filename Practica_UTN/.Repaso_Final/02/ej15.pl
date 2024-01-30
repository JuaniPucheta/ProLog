/*
    Ingresar una lista y determinar a través de una segunda lista todos los
    elementos que se repiten (sin usar ningun tipo de funcion de prolog).
*/

%! Importante aprender

inicio:- writeln('Ingrese una lista: '), 
    leer(Lista), 
    repetidos(Lista, Repetidos), 
    write('Los elementos repetidos son: '), 
    writeln(Repetidos).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

pertenece([X], X).
pertenece(X, [_|T]) :- pertenece(X, T).

repetidos([], []).

repetidos([H|T1], [H|T2]) :- pertenece(H, T1), repetidos(T1, T2).
    %* (1) el primer H esta instanciado, el segundo no
    %* (2) si el pertenece da true, el primer H se copia en la lista que estoy armando `[H|T2]`
    %* (3) llamo recursivamente a `repetidos` con T2
    
    %* (4) T2 en ningun momento toma valor. Se va anidando un valor inconcluso, hasta que se inicia en vacio,
        % y a partir de que se inicia en vacio, empieza volver hacia atras, y todos los valores de H1 que quedaron 
        % en la pila se van metiendo ahi adentro. Cuando termina la regla, ese argumento tiene todos los valores
        % que le fui agregando.
        
repetidos([_|T], Repetidos) :- repetidos(T, Repetidos).
    %* (3) si falla, viene aca. Ignoro la cabeza que no esta repetida, envio recursivamente la cola y Repetidos


