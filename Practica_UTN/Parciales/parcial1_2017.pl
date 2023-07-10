/* Ejercicio 1
    En una base de datos de una empresa de venta de robots domesticos, se tiene la 
    siguiente estructura de hechos:

    compro_robot(persona, codigo_robot, nombreModelo).
    modelo_marca(nombreModelo, marca).    

    Hacer un programa en ProLog que permita ingresar una persona y una marca, e informe
    de manera intelegible si la persona compro o no compro algun modelo de esa marca.
*/

compro_robot(julian, a001, roomba).
compro_robot(franco, q900, zenbo).
compro_robot(eduardo, h010, aspiradoraLG).

modelo_marca(roomba, iRobot).
modelo_marca(zenbo, asus).
modelo_marca(aspiradoraLG, lg).

inicio:- write("Ingrese una persona: "), read(Persona),
    write("Ingrese una marca: "), read(Marca),
    compro_robot(Persona, _, Modelo),
    modelo_marca(Modelo, Marca),
    write("La persona "), write(Persona), 
        write(" compro el modelo "), write(Modelo), 
        write(" de la marca "), write(Marca).
inicio:- write("La persona no compro ningun modelo de esa marca.").

/* Ejercicio 2
    Siguiendo con el caso de la empresa de venta de robots domesticos, hacer un 
    programa en ProLog que permita ingresar una lista con el precio de cada uno
    de sus productos (se ingresa solo el precio) e informe:
    1. El precio minimo.
    2. El precio maximo.

    Por ejemplo: la lista [2000, 1500, 1500, 3000] corresponde al precio de 4 robots 
    domesticos de la empresa. El precio minimo en este caso es de 1500 y el maximo 3000
*/

inicio2:- write("Ingrese una lista de precios: "), leer([H|T]),
    minimo(T, H, Minimo), maximo(T, H, Maximo),
    write("El precio minimo es: "), write(Minimo), nl,
    write("El precio maximo es: "), write(Maximo).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

minimo([], Min, Min).
minimo([H|T], MinIni, Min):- H < MinIni, minimo(T, H, Min).
minimo([_|T], MinIni, Min):- minimo(T, MinIni, Min).

maximo([], Max, Max).
maximo([H|T], MaxIni, Max):- H > MaxIni, maximo(T, H, Max).
maximo([_|T], MaxIni, Max):- maximo(T, MaxIni, Max).

