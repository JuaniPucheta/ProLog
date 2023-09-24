:- dynamic gasto/2.

abrir_base:- 
    retractall(gasto(_,_)), 
    consult("db4.txt").

menu:- 
    abrir_base,
    write("Opcion 1 - persona gasto"), nl,
    write("Opcion 2 - persona consumo +150"), nl,
    write("Opcion 3 - persona gasto promedio"), nl,
    write("Opcion 0 - Salir "),
    nl,
    read(Opcion),
    Opcion\=0,
    opcion(Opcion),
    menu.
menu.

opcion(1):- 
    write("Ingrese nombre del gasto: "),
    read(Gasto),
    write("Las personas q hicieron ese gasto fueron: "), nl,
    buscar_gasto(Gasto).

buscar_gasto(super):-
    gasto(Nombre, super(_,_)),
    write(Nombre), nl,
    retract(gasto(Nombre, super(_,_))),
    buscar_gasto(super).

buscar_gasto(tel):-
    gasto(Nombre, tel(_,_)),
    write(Nombre), nl,
    retract(gasto(Nombre, tel(_,_))),
    buscar_gasto(tel).

buscar_gasto(_):- write("No hay mas personas con gasto"), nl.

opcion(2):-
    write("Ingrese gasto: "),
    read(Gasto),
    write("Las personas con gasto +150 son: "), nl,
    gasto_superior(Gasto).

gasto_superior(super):-
    gasto(Nombre, super(_,Monto)),
    Monto > 150,
    write(Nombre), nl,
    retract(gasto(Nombre, super(_,Monto))),
    gasto_superior(super).

gasto_superior(tel):-
    gasto(Nombre, tel(_,Monto)),
    Monto > 150,
    write(Nombre), nl,
    retract(gasto(Nombre, tel(_,Monto))),
    gasto_superior(tel).

gasto_superior(_):- write("No hay gasto +150"), nl.
   
opcion(3):-
    write("Ingrese el nombre de la persona: "),
    read(Persona), 
    promedio(Persona, Cantidad, Total),
    % promedio_super(Persona, CantidadS, TotalS),
    % promedio_tel(Persona, CantidadT, TotalT),
    % Cantidad is CantidadS + CantidadT,
    % Total is TotalS + TotalT,
    Promedio is Total/Cantidad, 
    write(Promedio), nl.


% promedio_super(Persona, Cont, Total):-
%     gasto(Persona, super(_,Monto)),
%     retract(gasto(Persona, super(_,Monto))),
%     promedio_super(Persona, ContAnterior, TotalAnterior),
%     Total is TotalAnterior + Monto, 
%     Cont is ContAnterior + 1.

% promedio_super(_, 0, 0).

% promedio_tel(Persona, Cont, Total):-
%     gasto(Persona, tel(_,_,Monto)),
%     retract(gasto(Persona, tel(_,_,Monto))),
%     promedio_tel(Persona, ContAnterior, TotalAnterior),
%     Total is TotalAnterior + Monto, 
%     Cont is ContAnterior + 1.

% promedio_tel(_, 0, 0).

promedio(Persona, Cantidad, Total):-
    gasto(Persona, super(_,Monto)), %el retract va justo debajo de llamar a la db
    retract(gasto(Persona, super(_,Monto))),
    promedio(Persona, CantidadAnterior, TotalAnterior),
    Cantidad is CantidadAnterior + 1,
    Total is TotalAnterior + Monto.

promedio(Persona, Cantidad, Total):-
    gasto(Persona, tel(_,_,Monto)),
    retract(gasto(Persona, tel(_,_,Monto))),
    promedio(Persona, CantidadAnterior, TotalAnterior),
    Cantidad is CantidadAnterior + 1,
    Total is TotalAnterior + Monto.

promedio(_,0,0).