/*
    Dada la siguiente base de hechos:
        % auto(patente,propietario)
        % deuda(patente, monto adeudado)
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

tiene_deuda(P) :- auto(Patente, P), deuda(Patente, _).