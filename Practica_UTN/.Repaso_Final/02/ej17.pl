/*
    En una base de hechos hay un registro de personas y viajes realizados:
    persona(nombre, [lista ciudades visitó])
    Construir una regla que permita verificar si una persona visitó una
    determinada ciudad (datos de entrada: nombre persona y ciudad).
*/

persona(juan, [roma, londres]).
persona(maria, [roma, paris, madrid]).
persona(pedro, [roma, madrid]).
persona(luis, [madrid, londres]).

inicio:- write('Ingrese el nombre de la persona: '), read(Nombre),
         write('Ingrese la ciudad: '), read(Ciudad), nl,
         visito(Nombre, Ciudad), write('La persona visito la ciudad').

visito(Nombre, Ciudad) :-
    persona(Nombre, Destinos),
    obtener_ciudad(Destinos, Ciudad).

obtener_ciudad([H|_], H).
obtener_ciudad([_|T], Ciudad) :- obtener_ciudad(T, Ciudad).
