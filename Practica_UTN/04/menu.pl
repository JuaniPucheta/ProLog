menu:- 
    writeln("1 - opcion 1"),
    writeln("2 - opcion 2"),
    writeln("0 - salir"),
    read(Opcion),
    Opcion \= 0,
    opcion(Opcion),
    menu.
menu.

opcion(1):- writeln("Opcion 1").
        