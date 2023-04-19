% HECHOS
hombre(abraham).
hombre(clancy).
hombre(herbert).
hombre(homero).
hombre(bart).
mujer(mona).
mujer(jacqueline).
mujer(patty).
mujer(selma).
mujer(marge).
mujer(lisa).
mujer(maggie).
mujer(ling).
padres(herbert, mona, abraham).
padres(homero, mona, abraham).
padres(patty, jacqueline, clancy).
padres(selma, jacqueline, clancy).
padres(marge, jacqueline, clancy).
padres(bart, marge, homero).
padres(lisa, marge, homero).
padres(maggie, marge, homero).
padres(ling, selma, nadie).

% REGLAS
hermana(A,B):-mujer(A), padres(A, Madre, Padre), padres(B, Madre, Padre), A\=B.
nieto(A,B):-hombre(A), padres(A, _, Padre), padres(Padre, _, B).
nieto(A,B):-hombre(A), padres(A, _, Padre), padres(Padre, B, _).
nieto(A,B):-hombre(A), padres(A, Madre, _), padres(Madre, _, B).
nieto(A,B):-hombre(A), padres(A, Madre, _), padres(Madre, B, _).
abuelo(A,B):-hombre(A), padres(B, _, PadreB), padres(PadreB, _, A).
abuelo(A,B):-hombre(A), padres(B, MadreB, _), padres(MadreB, _, A).
tia(A,B):-mujer(A), padres(B, MadreB, _), padres(A, Madre, Padre), padres(MadreB, Madre, Padre), A\=MadreB.
tia(A,B):-mujer(A), padres(B, _, PadreB), padres(A, Madre, Padre), padres(PadreB, Madre, Padre).

% OTRA FORMA DE EXPRESAR tia/2
tia2(A,B):-mujer(A), padres(B, MadreB, _), hermana(A,MadreB).
tia2(A,B):-mujer(A), padres(B, _, PadreB), hermana(A,PadreB).

% CONSULTAS
/*
?- hermana(bart,_).
false.

?- hermana(_,bart).
true .

?- hermana(ling,_).
false.

?- hermana(lisa,maggie).
true.

?- hermana(maggie,Quien).
Quien = bart ;
Quien = lisa .

?- hermana(marge,patty).
true .

?- hermana(marge,homero).
false.

?- nieto(bart,abraham).
true .

?- nieto(bart,Quien).
Quien = abraham ;
Quien = mona ;
Quien = clancy ;
Quien = jacqueline.

?- nieto(lisa,_).
false.

?- abuelo(clancy,Quien).
Quien = bart ;
Quien = lisa ;
Quien = maggie ;
Quien = ling.

?- abuelo(Quien1,Quien2).
Quien1 = abraham,
Quien2 = bart ;
Quien1 = abraham,
Quien2 = lisa ;
Quien1 = abraham,
Quien2 = maggie ;
Quien1 = clancy,
Quien2 = bart ;
Quien1 = clancy,
Quien2 = lisa ;
Quien1 = clancy,
Quien2 = maggie ;
Quien1 = clancy,
Quien2 = ling ;
false.

?- abuelo(mona,_).
false.

?- abuelo(_,lisa).
true .

?- tia(Quien1,Quien2).
Quien1 = patty,
Quien2 = bart ;
Quien1 = patty,
Quien2 = lisa ;
Quien1 = patty,
Quien2 = maggie ;
Quien1 = patty,
Quien2 = ling ;
Quien1 = selma,
Quien2 = bart ;
Quien1 = selma,
Quien2 = lisa ;
Quien1 = selma,
Quien2 = maggie ;
Quien1 = marge,
Quien2 = ling ;
false.

?- tia(Quien,bart).
Quien = patty ;
Quien = selma ;
false.

?- tia(herbert,_).
false.
*/