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
    Promedio is Total/Cantidad, 
    write(Promedio), nl.

promedio(Persona, Cont, Total):- 
    retract(gasto(Persona, super(_, Monto))),
    gasto(Persona, super(_, Monto)),
    promedio(Persona, ContAnterior, TotalAnterior),
    Total is TotalAnterior + Monto, 
    Cont is ContAnterior + 1.

promedio(Persona, Cont, Total):-
    retract(gasto(Persona, tel(_,_,Monto))),
    gasto(Persona, tel(_,_,Monto)),
    promedio(Persona, ContAnterior, TotalAnterior),
    Total is TotalAnterior + Monto, 
    Cont is ContAnterior + 1.

promedio(_,0,0).

% promedio(Persona, Cant, Total):-
%     retract(gasto(Persona, Gasto)),
%     gasto_monto(Gasto, Monto), 
%     promedio(Persona, CantAnterior,TotalAnterior),
%     Total is TotalAnterior + Monto, Cant is CantAnterior + 1.

% promedio(_,0,0).  

% gasto_monto(super(_,Monto), Monto).
% gasto_monto(tel(_,_,Monto), Monto).