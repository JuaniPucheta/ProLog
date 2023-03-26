/*
    * Base de Conocimiento.
    * Nombre del programador: J. I. P.
    ? Programa: Programa para demostración de sintaxis y Elementos de prolog, 
        ? calcula los progenitores y cabezas de familia.
*/


%* Hechos 
%* Se lee "pilar es progenitor de belén"
es_progenitor(pilar,belen).
es_progenitor(tomas,belen).
es_progenitor(tomas,lucia).
es_progenitor(belen,ana).
es_progenitor(belen,pedro).
es_progenitor(belen,juan).
es_progenitor(belen,carlos).
es_progenitor(belen,martha).
es_progenitor(belen,alicia).
es_progenitor(pedro,jose).
es_progenitor(pedro,maria).
%---------------------------------------------------------------------------------

%---------------------------------------------------------------------------------
%* Se lee "belen descansa"
%* Se lee "pedro es niño o infante"
descanso(belen).
infante(pedro).
%---------------------------------------------------------------------------------


/*
! Regla 1. Belen cuida a pedro si belen esta descansando, y ademas pedro es un niño o un infante
! Regla 2. X es madre de Y si X es mujer, y además X es progenitor de Y
*/

cuida(belen,pedro):-descanso(belen),infante(pedro).
madre(X,Y):-mujer(X),es_progenitor(X,Y).

mujer(pilar).
mujer(belen).
mujer(lucia).
mujer(ana).
mujer(maria).
hombre(tomas).
hombre(pedro).
hombre(jose).
%---------------------------------------------------------------------------------

/*
! Regla 3. X es antepasado de Y si X es progenitor de Y
! Regla 4. X es antepasado de Y si X es progenitor de Z, y Z es antepasado de Y
*/

es_antepasado(X,Y):-es_progenitor(X,Y).
es_progenitor(X,Y):-es_progenitor(X,Z), es_antepasado(Z,Y).
%---------------------------------------------------------------------------------


%---------------------------------------------------------------------------------
%* Hechos
amigos(pedro,antonio). amigos(pedro,juana). amigos(fernando,pedro).
%---------------------------------------------------------------------------------

%---------------------------------------------------------------------------------
/*
! Regla 5. X e Y son amigos si X es amigo de Y
! Regla 6. Y y X son amigos si Y es amigo de X
*/

son_amigos(X,Y):-amigos(X,Y).
son_amigos(Y,X):-amigos(Y,X).
%---------------------------------------------------------------------------------

%---------------------------------------------------------------------------------
grande(pepe).
grande(cabeza(juan)).

/*
! Regla 7. X es grande si X es mayor a Y.
! Regla 8. X es mayor que Y si X es progenitor de Y.
*/

grande(X):-mayor(X,_Y).
mayor(cabeza(X),cabeza(Y)):-es_progenitor(X,Y).
%---------------------------------------------------------------------------------