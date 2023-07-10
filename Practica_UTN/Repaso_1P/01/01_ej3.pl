/* Escribir un programa Prolog que responda consultas acerca de cuáles son los 
rivales de una determinada selección en un campeonato mundial.

Una selección tiene como rivales todos los otros equipos de su mismo grupo.

Incluir en el programa la siguiente información: 
    • El grupo 1 está formado por Brasil, España, Jamaica e Italia. 
    • El grupo 2 está formado por Argentina, Nigeria, Holanda y Escocia.

El programa debe ser capaz de responder a las siguientes consultas: 
    a) ¿Son rivales Argentina y Brasil? 
    b) ¿Cuáles son los rivales de un determinado equipo (por ejemplo Holanda)? */

pertenece(brasil, 1).
pertenece(espania, 1).
pertenece(jamaica, 1).
pertenece(italia, 1).

pertenece(argentina, 2).
pertenece(nigeria, 2).
pertenece(holanda, 2).
pertenece(escocia, 2).

%? a) y b)
son_rivales(X,Y) :- pertenece(X, N), pertenece(Y, N), X \= Y.