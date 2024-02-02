/*
    - venta(Dni, Descripción, FechaAdquisición, Importe)
    - FechaAdquisición como DD-MM-YYYY
    
    1- Dado un DNI y un año, mostrar el consumo promedio realizado. 
        Si no hay clientes con ese DNI o no hay consumos para ese año, informar con un mensaje.
    
    2- Dada la descripción, obtener un listado de DNIs de las personas que 
        compraron dicho producto el año pasado.
    
    3- Calcular el máximo consumo de una persona ingresando el DNI.

    Tuve que usar sub_atom y atom_number.
*/

:- dynamic venta/4.
:- discontiguous opcion/1.

abrir_base :-
    retractall(venta(_,_,_,_)),
    consult('final4.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Consumo promedio realizado por dni y anio.'),
    writeln('Opcion 2 - Listado personas que compraron X producto en 2023.'),
    writeln('Opcion 3 - Maximo consumo de una persona ingresando Dni.'),
    writeln('Opcion 4 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 4,
    opcion(Opcion),
    inicio.
inicio.

%* sub_atom(Cadena, ComienzoCadena, CantidadCaracteres, CantidadCaracteresRestantes, SubCadena)
%! Importante --> atom_number
opcion(1) :-
    write('Ingrese DNI: '), read(Dni),
    write('Ingrese anio'), read(Anio),
    calcular_consumo_promedio(Dni, Anio, Cantidad, Total),
    verificar(Total),
    Promedio is Total / Cantidad,
    write('El consumo promedio fue: '), write(Promedio), nl.

    calcular_consumo_promedio(Dni, Anio, Cantidad, Total) :-
        venta(Dni, _, FechaEntera, Importe),
        retract(venta(Dni, _, FechaEntera, Importe)),
        sub_atom(FechaEntera, _, 4, 0, FechaAnio),
        atom_number(FechaAnio, AnioInteger),
        AnioInteger = Anio,
        calcular_consumo_promedio(Dni, Anio, CantAux, Subtotal),
        Cantidad is CantAux + 1,
        Total is Subtotal + Importe.
    calcular_consumo_promedio(_,_,0,0).

    verificar(Total) :- 
        Total = 0, write('No hay consumos para ese Dni, o el Dni no existe').
    verificar(_).
    
opcion(2) :-
    write('Ingresar descripcion del producto: '), read(Descripcion),
    listado_personas(Descripcion, Personas),
    write('Dni de personas que compraron eso en 2023: '), write(Personas), nl.

    listado_personas(Descripcion, [H|T]) :-
        venta(H, Descripcion, FechaEntera, _),
        retract(venta(H, Descripcion, FechaEntera, _)),
        sub_atom(FechaEntera, _, 4, 0, FechaAnio),
        atom_number(FechaAnio, AnioInteger),
        AnioInteger = 2023,
        listado_personas(Descripcion, T).
    listado_personas(_, []).
    
opcion(3) :-
    write('Ingresar el Dni de la persona: '), read(Dni),
    calcular_maximo_consumo(Dni, Total),
    write('Consumo de la persona: '), write(Total).

    calcular_maximo_consumo(Dni, Total) :-
        venta(Dni, _, _, Importe),
        retract(venta(Dni, _, _, Importe)),
        calcular_maximo_consumo(Dni, Subtotal),
        Total is Subtotal + Importe.
    calcular_maximo_consumo(_, 0).