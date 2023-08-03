/* Ejercicio 1
    En una base de datos de una empresa de venta de autos autónomos, 
    se tiene la siguiente estructura de hechos:
    - compro_auto_autonomo(persona, anioCompra, nombreModelo).
    - modelo_marca(nombreModelo, marca).

    Como por ejemplo:
    compro_auto_autonomo(pablo, 2019, 'Volvo XC90').
    compro_auto_autonomo(alejandro, 2017, 'Chrysler pacifica').

    modelo_marca('Volvo XC90', uber).
    modelo_marca('Chrysler pacifica', waymo).

    Hacer un programa en ProLog que permita ingresar una persona, un anio y una marca,
    e informe si la persona NO compro algun modelo de esa marca ese anio con un mensaje
    con la siguiente estructura:
    "La persona...no compro un auto de marca...en el anio..."
*/

compro_auto_autonomo(pablo, 2019, 'Volvo XC90').
compro_auto_autonomo(alejandro, 2017, 'Chrysler pacifica').

modelo_marca('Volvo XC90', uber).
modelo_marca('Chrysler pacifica', waymo).

inicio :- write("Ingrese una persona: "), read(Persona),
    write("Ingrese un anio: "), read(AnioCompra),
    write("Ingrese el nombre del modelo: "), read(NombreModelo),
    not(compro_auto_autonomo(Persona, AnioCompra, NombreModelo)),
    modelo_marca(NombreModelo, Marca),
    write("La persona "), write(Persona), write(" no compro un auto de marca "), write(Marca), write(" en el anio "), write(AnioCompra).

/* Ejercicio 2
    Siguiendo el caso de la empresa de venta de autos autónomos hacer un programa   
    en ProLog que permita ingresar una lista con el precio de cada uno de ellos 
    (se ingresa solo el precio) e informe:
    1. La suma del primer elemento de la lista, mas el segundo, mas el ultimo.
    2. El penultimo elemento de la lista
*/

inicio2:- write("Ingrese una lista de precios: "), leer(Lista),
    dosPrimeros(Lista, [H1, H2]),
    ultimo(Lista, Ultimo),
    Suma is H1 + H2 + Ultimo,
    write("La suma del primer elemento de la lista, mas el segundo, mas el ultimo es: "), write(Suma), nl,
    penultimo(Lista, Penultimo),
    write("El penultimo elemento de la lista es: "), write(Penultimo).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

dosPrimeros([H1, H2 | _], [H1, H2]).

ultimo([H|[]], H).
ultimo([_|T], Ultimo) :- ultimo(T, Ultimo).

penultimo([X,_], X).
penultimo([_|T], X) :- penultimo(T, X).
