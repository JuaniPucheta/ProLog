/*
    Se tiene la siguiente base de hechos.

    Donde hijo(X,Y) indica que X es hijo de Y.

    Definir la regla descendiente(A,B), la cual permite determinar si A es descendiente de B. 
*/

hijo(roberto,carlos).

hijo(julio,roberto).
hijo(miguel,roberto).

hijo(juan,miguel).
hijo(jose,miguel).

descendiente(A, B) :- hijo(A, B).
descendiente(A, B) :- hijo(A, X), descendiente(X, B).