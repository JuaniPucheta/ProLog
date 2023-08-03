/*
    Dada la siguiente base de hechos:
        % auto(patente,propietario) 
            auto(hti687,pedro). auto(jug144,juan). auto(gqm758,pedro). 
            auto(lod445,carlos). auto(lfz569,miguel). auto(axk798,maria).
        % deuda(patente, monto adeudado) 
            deuda(lfz569,2000). deuda(gqm758,15000). deuda(axk798,1000).

    Escriba una regla que permita determinar si una persona (dato entrada) tiene algún auto con deuda.
*/

auto(hti687,pedro). 
auto(jug144,juan). 
auto(gqm758,pedro). 
auto(lod445,carlos).
auto(lfz569,miguel). 
auto(axk798,maria).  

deuda(lfz569,2000). 
deuda(gqm758,15000). 
deuda(axk798,1000).

tiene_deuda(P, A) :- auto(A, P), deuda(A, _).
%? otra forma --> tiene_deuda(P) :- auto(A, P), deuda(A, _).