/*
    - sucursal(id, nombre, _, _)
    -producto(id, nombre, necesitaRefrigeracion, fechaVencimiento, idSucursal, _)
    
    Nota 2: necesitaRefrigeracion era un string "Si"/"No" y fechaVencimiento estaba en formato "DD/MM/YYYY"

    1) dada una lista de sucursales, listado de productos que requieran conservación con refrigeración 
        y listado de los que NO requieran, definiendo y usando una función llamada dividir_por_conservacion/3
    
    2) listado de sucursales que tengan al menos 2 productos con fecha_vencimiento en 2024
*/

:- dynamic sucursal/2.
:- dynamic producto/5.
:- discontiguous opcion/1.

abrir_base :-
    retractall(sucursal(_,_)),
    retractall(producto(_,_,_,_,_)),
    consult('final5.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Listado de productos con y sin conservacion.'),
    writeln('Opcion 2 - Listado de sucursales con +2 productos vencimiento 2024.'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

%TODO --> consultar | no funciona, solo trae `coca`, es igual que en ad2.pl
opcion(1) :-
    write('Ingrese una lista de sucursales: '), leer(ListaSucursales),
    dividir_por_conservacion(ListaSucursales, ListaConRefri, ListaSin), nl,
    write('Lista con refrigeracion: '), write(ListaConRefri), nl,
    write('Lista sin refrigeracion: '), write(ListaSin), nl.

    leer([H|T]) :- read(H), H \= [], leer(T).
    leer([]).

    dividir_por_conservacion([H|T], [NombreProducto|T2], ListaSin) :-
        % sucursal(H, _),
        % retract(sucursal(H, _)),
        producto(IdProducto, NombreProducto, 'si', _, H),
        retract(producto(IdProducto, NombreProducto, 'si', _, H)),
        dividir_por_conservacion(T, T2, ListaSin).

    dividir_por_conservacion([H|T], ListaConRefri, [NombreProducto|T3]) :-
        % sucursal(H, _),
        % retract(sucursal(H, _)),
        producto(IdProducto, NombreProducto, 'no', _, H),
        retract(producto(IdProducto, NombreProducto, 'no', _, H)),
        dividir_por_conservacion(T, ListaConRefri, T3).

    dividir_por_conservacion([], [], []).

opcion(2) :-
    listar_sucursales_vencimiento(Lista, Sucursales), nl,
    write('Sucursales con +2 productos con vencimiento 2024: '), 
    write(Lista), write(' - '), write(Sucursales), nl.

    listar_sucursales_vencimiento([H|T], [NombreSucursal|T2]) :-
        sucursal(H, NombreSucursal),
        retract(sucursal(H, NombreSucursal)),
        contar_sucurales(H, Cantidad),
        Cantidad >= 2,
        listar_sucursales_vencimiento(T, T2).
    listar_sucursales_vencimiento([], []).

        contar_sucurales(IdSucursal, Cantidad) :-
            producto(IdProducto, _, _, FechaVencimiento, IdSucursal),
            retract(producto(IdProducto, _, _, FechaVencimiento, IdSucursal)),
            sub_atom(FechaVencimiento, _, 4, 0, '2024'),
            contar_sucurales(IdSucursal, CantAux),
            Cantidad is CantAux + 1.
        contar_sucurales(_, 0).

            
            

