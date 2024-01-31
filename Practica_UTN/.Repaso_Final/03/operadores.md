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
