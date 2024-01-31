> [!NOTE]  
> Acá se especifican los *predicados* que hay para esta práctica y su explicación

> [!TIP]
> `atom_length(Cadena, Longitud)`

## Explicación
Predicado para obtener la longitud de una cadena

### Ejemplos
```
?- atom_length('Hello, World!', Length).
Length = 13.
```

> [!TIP]
> `sub_atom(Cadena, ComienzoCadena, CantidadCaracteres, CantidadCaracteresRestantes, SubCadena)`

## Explicación
Predicado que permite obtener una subcadena de una cadena original

### Ejemplos
```
?- sub_atom('atahualpa', 3, 4, _, X).
X = hual.
```
```
?- sub_atom('atahualpa', 0, 3, _, X).
X = ata.
```
```
?- sub_atom('atahualpa', 0, 3, R, X).
R = 6,
X = ata.
```
```
?- sub_atom('atahualpa', 3, _, 0, X).
X = hualpa.
```

- Para preguntar si una cadena contiene a una subcadena...
```
?- sub_atom('atahualpa', _, _, _, 'hual').
true.
```
```
?- sub_atom('atahualpa', _, _, _, 'casa').
false.
```

- Para preguntar la posición de una subcadena en una cadena...
```
?- sub_atom('atahualpa', Posicion, _, _, 'hual').
Posicion = 3.
```
```
?- sub_atom('atahualpa', Posicion, _, _, 'casa').
false.
```
