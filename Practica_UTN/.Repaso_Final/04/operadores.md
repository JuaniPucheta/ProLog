> [!NOTE]  
> Acá se especifican los *conceptos* que hay para esta práctica y su explicación

> [!TIP]
> `Base de Datos`

## Explicación
* Conjunto de hechos, definidos en un archivo propio.
* Separar la base de conocimiento del programa.
* Los datos se persisten en un archivo de texto plano.
* Se puede consultar, agregar y eliminar hechos de la base de datos.

#### Funcionamiento
```
inicio:- consult('datos.txt').
```
```
// Consultar la base y levantarla en memoria
    consult('datos.txt').
// Agregar un hecho a la base
    assert(hecho).
// Eliminar un hecho de la base
    retract(hecho).
// Grabar la base en el disco
    guardar :- tell(nombreArchivo), listening(predicado), told.
```

### Ejemplos
* Listar por pantalla los hijos de una madre 
```prolog   
% Utilizando recursividad. Requiere borrar el hecho de memoria
listarHijos(P, M) :-
    padres(H, M, P),
    write(H),
    retract(padres(H, M, P)),
    listarHijos(P, M).
listarHijos(_, _).
```

* ¿Cuántos hijos tiene un padre?
```prolog
% Utilizando recursividad y un contador parcial
contar(P, CantParcial, CantFinal) :-
    padres(H, P, _),
    retract(padres(H, P, _)),
    CantNuevo is CantParcial + 1,
    contar(P, CantNuevo, CantFinal).
contar(_, CantFinal, CantFinal).

% Forma recomendable
contar(P, Cant) :- 
    padres(H, P, _),
    retract(padres(H, P, _)),
    contar(P, CantParcial),
    Cant is CantParcial + 1.
contar(_, 0).
```

### Ejemplo básico
```prolog
:- dynamic padres/3.
:- discontiguous opcion/1.  % quitamos warning

inicio :- abrir_base, agregarNuevo, guardar.

abrir_base :- consult('datos.txt').

agregarNuevo :-
    write("Ingrese hijo: "), read(H),
    write("Ingrese madre: "), read(M),
    write("Ingrese padre: "), read(P),
    assert(padres(H, M, P)).

guardar :- tell('datos.txt'), listing(padres), told.
```

> [!TIP]
> `Functores`

## Explicación
Cuando un argumento es a su vez un predicado, se llama FUNCTOR.
Es un hecho dentro de un hecho.

### Ejemplos
```prolog
gasto(juan, luz(500)).
gasto(pepe, gas(200)).
```

* ¿En qué gasta Juan?
```prolog
?- gasto(juan, X).
X = luz(500).
```

* ¿Cuánto gasta Juan en luz?
```prolog
?- gasto(juan, luz(X)).
X = 500.
```

* ¿Paga juan cochera?
```prolog
?- gasto(juan, cochera(_)).
false.
```

* ¿Quienes pagan luz?
```prolog
?- gasto(X, luz(_)).
X = juan.
X = pepe.
```


