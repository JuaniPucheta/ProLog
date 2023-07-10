/* Dados los siguientes predicados: hombre(unHombre). mujer(unaMujer). padres(persona, madre, padre).
    a. Construya una base de hechos con los miembros de su familia. 
    b. Defina las siguientes reglas: 
        • hermana/2, donde hermana(A,B) significa que A es hermana de B. 
        • nieto/2, donde nieto(A,B) significa que A es el nieto de B. 
        • abuelo/2, donde abuelo(A,B) significa que A es el abuelo de B. 
        • tia/2, donde tia(A,B) significa que A es la tía de B. Esta regla definirla, en una primera instancia, 
        valiéndose sólo de los hechos disponibles. 
        En una segunda instancia, valiéndose de alguna otra regla que pudieron haber definido previamente.*/

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

padres(bart, marge, homero).
padres(lisa, marge, homero).
padres(maggie, marge, homero).
padres(homero, mona, abraham).
padres(herbert, mona, abraham).
padres(marge, jacqueline, clancy).
padres(patty, jacqueline, clancy).
padres(selma, jacqueline, clancy).
padres(ling, selma, _).

%? hermana/2
hermana(A, B) :- A \= B, mujer(A), padres(A, M, P), padres(B, M, P).

%? nieto/2
% abuelo materno
nieto(A, B) :- hombre(A), padres(A, M, _), padres(M, _, B). 
% abuelo paterno
nieto(A, B) :- hombre(A), padres(A, _, P), padres(P, _, B). 
% abuela materna
nieto(A, B) :- hombre(A), padres(A, M, _), padres(M, B, _). 
% abuela paterna
nieto(A, B) :- hombre(A), padres(A, _, P), padres(P, B, _). 

%? abuelo/2
% abuelo materno
abuelo(A, B) :- hombre(A), padres(B, M, _), padres(M, _, A).
% abuelo paterno
abuelo(A, B) :- hombre(A), padres(B, _, P), padres(P, _, A).

%? tia/2 - primera instancia
% tia materna
tia(T, S) :- mujer(T), padres(T, M, P), padres(H, M, P), T \= H, padres(S, H, _).

%? tia/2 - segunda instancia
tia(T, S) :- hermana(T,H), padres(S, H, _).