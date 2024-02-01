/*
    Hacer un programa que permita realizar altas, bajas y consultas a la base
    de datos de una librería. De cada libro se registran los siguientes datos:
        • Nro. de libro (auto numérico)
        • Titulo
        • Autor
        • Editorial
        • Precio
    La base datos debe guardarse en disco.
    Calcular además el precio promedio de los libros de un determinado autor. 
*/

:- dynamic libro/5.
:- discontiguous opcion/1.

abrir_base :-
    retractall(libro(_,_,_,_,_)),
    consult('ej5.txt').

guardar_base :- tell('ej5.txt'), listing(libro), told.

inicio :-
    abrir_base,
    writeln(''),
    writeln('=========================================='),
    writeln('Opcion 1 - Alta libro'),
    writeln('Opcion 2 - Baja libro'),
    writeln('Opcion 3 - Consulta libro'),
    writeln('Opcion 4 - Precio promedio por autor'),
    writeln('Opcion 5 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 5,
    opcion(Opcion),
    inicio.
inicio.


opcion(1) :-
    ultimo_codigo_libro(0, Numero),
    Codigo is Numero + 1,
    write('Ingrese el titulo del libro: '), read(Titulo),
    write('Ingrese el autor del libro: '), read(Autor),
    write('Ingrese el editorial del libro: '), read(Editorial),
    write('Ingrese el precio del libro: '), read(Precio),
    
    % descarto todo lo que borro en `ultimo_codigo_libro`
    abrir_base,
    
    assert(libro(Codigo, Titulo, Autor, Editorial, Precio)),
    guardar_base.

    %* Codigo-autoincremental 
    ultimo_codigo_libro(Numero, NFinal) :-
        libro(Nro, _, _, _, _),
        Nro > Numero,
        N is Nro,
        retract(libro(N, _, _, _, _)),
        ultimo_codigo_libro(Nro, NFinal).
    ultimo_codigo_libro(Numero, Numero).

opcion(2) :-
    write('Ingrese el titulo del libro para dar de baja: '), read(Titulo),
    borrar_libro(Titulo).

    borrar_libro(Titulo) :-
        retract(libro(_, Titulo, _, _, _)),
        guardar_base,
        write('Libro borrado'), nl.
    
    borrar_libro(Titulo) :- write('El libro: '), write(Titulo), write(' no existe.'), nl.

opcion(3) :-
    write('Ingrese el titulo del libro a consultar: '), read(Titulo),
    libro(Codigo, Titulo, Autor, Editorial, Precio), nl,
    write('Codigo: '), write(Codigo), nl,
    write('Titulo: '), write(Titulo), nl,
    write('Autor: '), write(Autor), nl,
    write('Editorial: '), write(Editorial), nl,
    write('Precio: '), write(Precio), nl,
    fail.

opcion(4) :-
    write('Ingrese el nombre del autor: '), read(Autor),
    precio_promedio(Autor, Cantidad, Total),
    Promedio is Total / Cantidad,
    write('El precio promedio es: '), write(Promedio), nl.

    precio_promedio(Autor, Cantidad, Total) :-
        libro(_, _, Autor, _, Precio),
        retract(libro(_, _, Autor, _, Precio)),
        precio_promedio(Autor, CantAux, Subtotal),
        Cantidad is CantAux + 1,
        Total is Subtotal + Precio.

    precio_promedio(_, 0, 0).
