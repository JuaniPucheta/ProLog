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

visito(Nombre, Ciudad) :- persona(Nombre, Ciudades), visitoAux(Ciudades, Ciudad).

visitoAux([Ciudad|_], Ciudad).
visitoAux([_|Ciudades], Ciudad) :- visitoAux(Ciudades, Ciudad).

inicio:- write('Ingrese el nombre de la persona: '), read(Nombre),
         write('Ingrese la ciudad: '), read(Ciudad),
         visito(Nombre, Ciudad), write('La persona visito la ciudad').

/*
    ?Definición de hechos persona/2: Aquí se definen hechos que relacionan nombres de personas con las ciudades que han visitado.

    ?visito/2: Este predicado es el punto principal de la consulta. Se encarga de verificar si una persona ha visitado una ciudad en particular. Tiene dos argumentos: Nombre (nombre de la persona) y Ciudad (ciudad a verificar). Su lógica es:
    * Busca la lista de ciudades visitadas de la persona usando persona/2.
    * Llama al predicado auxiliar visitoAux/2 para determinar si la ciudad está en la lista de ciudades visitadas.
    
    ?visitoAux/2: Este predicado auxiliar verifica si una ciudad está en la lista de ciudades visitadas. Tiene dos argumentos: una lista de ciudades Ciudades y la Ciudad que se busca. Su lógica es:
    * Comprueba si la Ciudad coincide con la primera ciudad en la lista Ciudades. Si coinciden, entonces la persona ha visitado la ciudad.
    *Si no coinciden, llama recursivamente a visitoAux/2 con el resto de la lista Ciudades para seguir buscando.
    
    ?inicio/0: Este es el punto de entrada del programa. Realiza lo siguiente:
    * Pide al usuario que ingrese el Nombre de una persona y lo almacena en la variable Nombre.
    * Pide al usuario que ingrese una Ciudad y la almacena en la variable Ciudad.
    * Llama al predicado visito/2 para verificar si la persona visitó la ciudad ingresada.
    * Si la persona visitó la ciudad, muestra un mensaje indicando que la persona visitó la ciudad. Si no, no muestra nada.
*/