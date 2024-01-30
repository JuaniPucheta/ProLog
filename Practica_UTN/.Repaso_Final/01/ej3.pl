/*
    Escribir un programa Prolog que responda consultas acerca de cuáles son
    los rivales de una determinada selección en un campeonato mundial.
    Una selección tiene como rivales todos los otros equipos de su mismo grupo.
    
    Incluir en el programa la siguiente información:
        • El grupo 1 está formado por Brasil, España, Jamaica e Italia.
        • El grupo 2 está formado por Argentina, Nigeria, Holanda y Escocia.
    
    El programa debe ser capaz de responder a las siguientes consultas:
        a) ¿Son rivales Argentina y Brasil?
        b) ¿Cuáles son los rivales de un determinado equipo (por ejemplo Holanda)? 
*/

pertenece_grupo(brasil, 1).
pertenece_grupo(espania, 1).
pertenece_grupo(jamaica, 1).
pertenece_grupo(italia, 1).

pertenece_grupo(argentina, 2).
pertenece_grupo(nigeria, 2).
pertenece_grupo(holanda, 2).
pertenece_grupo(escocia, 2).

son_rivales(A, B) :- pertenece_grupo(A, G), pertenece_grupo(B, G), A \= B.
    %? Si no pongo A \= B, aparece "holanda" como un valor de X en son_rivales(holanda, X)
    %? ya que pertence al mismo grupo