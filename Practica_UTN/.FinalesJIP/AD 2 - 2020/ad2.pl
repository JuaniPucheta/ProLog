/*
    La red de almacenes “Comercio Justo” organiza su trabajo con un 
    programa en prolog que contará con una base de hechos con la siguiente estructura:

    - almacen(nombre, dirección, [lista de id de sucursales])
    - sucursal(id de sucursal, nombre, dirección, cantidad de empleados)
    - producto(nombre, precio, cadena de frio, fecha de vencimiento, id de sucursal)

    Cada almacen tiene una o mas sucursales, 
    de las cuales se conoce su nombre, dirección y su cantidad de empleados.
    
    De cada producto se conoce su nombre, su precio, si necesita cadena de frío 
    (Cuyo valor puede ser “Si” o “No”), la fecha de vencimiento (con el formato DD/MM/AAAA) 
    y la sucursal que lo tiene en stock.

    Desarrollar un programa en prolog que permita:
        1- Dado un almacén devolver la cantidad de empleados que tienen todas sus sucursales en total.
        2- Dada una lista de productos, crear la regla dividir_por_vencimiento/4 que devuelva 3 listas, 
        una con los productos que vencen en el año 2020, otra con los productos que 
        vencen en el año 2021 y otra con el resto de los productos.
*/

:- dynamic almacen/3.
:- dynamic sucursal/4.
:- dynamic producto/5.
:- discontiguous opcion/1.

abrir_base :-
    retractall(almacen(_,_,_)),
    retractall(sucursal(_,_,_,_)),
    retractall(producto(_,_,_,_,_)),
    consult('ad2.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Cantidad de empleados de todas las sucursales por almacen.'),
    writeln('Opcion 2 - Vencimientos'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

opcion(1) :-
    write('Ingrese un almacen: '), read(Almacen),
    busca_empleados_totales(Almacen, EmpleadosTotal),
    write('Cantidad de empleados del almacen: '), write(EmpleadosTotal), nl.

    busca_empleados_totales(Almacen, EmpleadosTotal) :-
        almacen(Almacen, _, ListaSucursales),
        retract(almacen(Almacen, _, ListaSucursales)),
        cuenta_empleados_sucursal(ListaSucursales, EmpleadosTotal).
    busca_empleados_totales(_, 0).

        cuenta_empleados_sucursal([H|T], EmpleadosParcial) :-
            sucursal(H, _, _, Empleados),
            retract(sucursal(H, _, _, Empleados)),
            cuenta_empleados_sucursal(T, EmpleadosAux),
            EmpleadosParcial is Empleados + EmpleadosAux.
        cuenta_empleados_sucursal([], 0).

%TODO --> consultar, sin retract funciona, no entiendo xq no va el `retract`, es xq solo muestra/lista??
opcion(2) :-
    write('Ingrese una lista de productos: '), leer(Lista),
    dividir_Por_Vencimiento(Lista, Lista2021, Lista2020, ListaResto), nl,
    write('Productos que vencen en 2021: '), write(Lista2021), nl,
    write('Productos que vencen en 2020: '), write(Lista2020), nl,
    write('Resto de los productos: '), write(ListaResto), nl.

    leer([H|T]) :- read(H), H \= [], leer(T).
    leer([]).

    dividir_Por_Vencimiento([H|T], [H|T2], Lista2020, ListaResto) :-
        producto(H, _, _, FechaVencimiento, _),
        % retract(producto(H, _, _, FechaVencimiento, _)),
        sub_atom(FechaVencimiento, _, 4, 0, '2021'),
        dividir_Por_Vencimiento(T, T2, Lista2020, ListaResto).

    dividir_Por_Vencimiento([H|T], Lista2021, [H|T2], ListaResto) :-
        producto(H, _, _, FechaVencimiento, _),
        % retract(producto(H, _, _, FechaVencimiento, _)),
        sub_atom(FechaVencimiento, _, 4, 0, '2020'),
        dividir_Por_Vencimiento(T, Lista2021, T2, ListaResto).

    dividir_Por_Vencimiento([H|T], Lista2021, Lista2020, [H|T2]) :-
        producto(H, _, _, _, _),
        % retract(producto(H, _, _, _, _)),
        dividir_Por_Vencimiento(T, Lista2021, Lista2020, T2).

    dividir_Por_Vencimiento([], [], [], []).


