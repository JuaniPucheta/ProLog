> [!NOTE]  
> Acá se especifican los ejercicios y métodos a estudiar para el final de la materia.

> [!IMPORTANT]  
> - `ej1.pl` -> mostrar una lista con *fail* y con *retract*.
> - `ej2.pl` -> guardar en BD.
> - `ej.pl` -> .
> - `menu de inicio`
```prolog
inicio:- 
    writeln("1 - opcion 1"),
    writeln("2 - opcion 2"),
    writeln("0 - salir"),
    read(Opcion),
    Opcion \= 0,
    opcion(Opcion),
    inicio.
inicio.

opcion(1):- writeln("Opcion 1").
``` 

