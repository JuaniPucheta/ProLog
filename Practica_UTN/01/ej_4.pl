/*
    Dados los siguientes predicados: hombre(unHombre). mujer(unaMujer). padres(persona, madre, padre).
    a. Construya una base de hechos con los miembros de su familia. 
    b. Defina las siguientes reglas: 
        • hermana/2, donde hermana(A,B) significa que A es hermana de B. 
        • nieto/2, donde nieto(A,B) significa que A es el nieto de B. 
        • abuelo/2, donde abuelo(A,B) significa que A es el abuelo de B. 
        • tia/2, donde tia(A,B) significa que A es la tía de B.  Esta regla definirla, 
            en una primera instancia, valiéndose sólo de los hechos disponibles.
            En una segunda instancia, valiéndose de alguna otra regla que pudieron haber definido previamente.
*/

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

% Regla para hermana/2
hermana(A,B) :- mujer(A), padres(A, M, P), padres(B, M, P), A \= B.

% Regla para nieto/2
nieto(A,B):- padres(A,_,P),padres(P,B,_).
nieto(A,B):- padres(A,_,P),padres(P,_,B).
nieto(A,B):- padres(A,M,_),padres(M,B,_).
nieto(A,B):- padres(A,M,_),padres(M,_,B).

% Regla para abuelo/2: 
abuelo(A,B) :- padres(B,_,P),padres(P,A,_).
abuelo(A,B) :- padres(B,_,P),padres(P,_,A).
abuelo(A,B) :- padres(B,M,_),padres(M,A,_).
abuelo(A,B) :- padres(B,M,_),padres(M,_,A).


%Regla para tia/2 para la primera instancia de la regla
tia(T,S) :-
    mujer(T),
    padres(T, M, P),
    padres(B, M, P),
    M \= P,
    padres(S, B, _).
tia(T,S) :-
    mujer(T),
    padres(T, M, P),
    padres(B, M, P),
    M \= P,
    padres(S, _, B).

%Regla para tia/2 para la segunda instancia de la regla
tia(T,S) :- 
    hermana(T, B),
    padres(S, B, _).
tia(T,S) :-
    hermana(T, B),
    padres(S, _, B).