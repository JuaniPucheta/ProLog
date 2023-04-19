/*
    [] es una lista y denota una lista vacia
    Xs es una lista entonce [X | Xs] es una lista donde la cabeza es X y la cosa es Xs
    Las listas de listas se suelen representar con Xss
*/

hombre(jose).
hombre(tomas).
hombre(pedro).
hombres([]).
hombres([X|Xs]) :- hombre(X), hombres(Xs).

noPertenece(X,[]).
noPertenece(X,[Y|Ys]) : - X\=Y, noPertenece(X,Ys).

num_elementos([],0).
num_elementos([X | Xs], total) :- num_elementos(Xs,Aux), Total is Aux + 1.

es_lista([]).
es_lista([_ | _]).

concatena([],L,L).
concatena([X | L1], L2, [X | L3]) :- concatena(L1,L2,L3).
/*
    => concaten([a,b,c],[d,e],L1)
	=> concatena([a,b,c],L1,[a,b,c,d,e,f])
	=> concatena(L1,L2,[a,b,c])
*/

ultimo(X,[X]).
ultimo(X,[_|Y]) :- ultimo(X,Y).
/*
	=> ultimo(d,[a,b,c,v,d,e,s,s])	false
    => ultimo(d,[a,b,c,e,f,g,s,d])	true
*/

eliminar(X,[X|Xs], Xs).
eliminar(X, [Y|Ys], [Y|Zs]) :- eliminar(X, Ys, Zs)
/*	=> eliminar(1, [1,2,1,3],L).	L=[2,1,3] */

insertar(E,L,[E|L]).
insertar(E,[X|Y],[X|Z]) :- insertar(E,Y,Z).
/*
	=> insertar(c,[a,b,c,d,e,f],[])	false
	=> insertar(w,[a,b,c,d,e,f],L)	L=[w,a,b,c,d,e,f]
*/