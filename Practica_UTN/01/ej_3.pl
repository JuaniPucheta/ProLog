/*
    Escribir un programa Prolog que responda consultas acerca de cuáles son los rivales de una 
        determinada selección en un campeonato mundial.
    Una selección tiene como rivales todos los otros equipos de su mismo grupo.
    Incluir en el programa la siguiente información: 
        • El grupo 1 está formado por Brasil, España, Jamaica e Italia. 
        • El grupo 2 está formado por Argentina, Nigeria, Holanda y Escocia.
    El programa debe ser capaz de responder a las siguientes consultas: 
        a) ¿Son rivales Argentina y Brasil? 
        b) ¿Cuáles son los rivales de un determinado equipo (por ejemplo Holanda)?
*/

% Grupo 1
pertence(brasil, 1).
pertence(espania, 1).
pertence(jamaica, 1).
pertence(italia, 1).

% Grupo 2
pertence(argentina, 2).
pertence(nigeria, 2).
pertence(holanda, 2).
pertence(escocia, 2).

% Rival
rival(X, Y) :- pertence(X, G), pertence(Y, G), X \= Y.

/* %? CONSULTAS
    a) ¿Son rivales Argentina y Brasil?
        ?- rival(argentina, brasil).
        false.

    b) ¿Cuáles son los rivales de un determinado equipo (por ejemplo Holanda)?
        ?- rival(holanda, X).
        X = argentina ;
        X = nigeria ;
        X = escocia.
*/