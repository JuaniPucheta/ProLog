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

% Regla para nieto/2: para que la regla funcione, bart debe ser nieto de abraham, y debe ser nieto de clancy
nieto(A,B) :- 
    hombre(A), 
    padres(A, Madre, Padre), 
    (padres(Madre, B, _); padres(Padre, B, _); padres(Madre, _, B); padres(Padre, _, B)).

% Regla para abuelo/2: para que la regla funcione:
/*
    abraham es abuelo de bart, lisa y maggie.
    clancy es abuelo de bart, lisa, maggie y ling.
*/ 
abuelo(A,B) :- %! me tira como abuelo: homero, bart 
    hombre(A), 
    padres(B, Madre, Padre), 
    (padres(Madre, A, _); padres(Padre, A, _); padres(Madre, _, A); padres(Padre, _, A)).

%Regla para tia/2 para la primera instancia %! anda mal, tira tia a lisa y maggie
tia2(A,B):-mujer(A), padres(B, MadreB, _), hermana(A,MadreB).
tia2(A,B):-mujer(A), padres(B, _, PadreB), hermana(A,PadreB).