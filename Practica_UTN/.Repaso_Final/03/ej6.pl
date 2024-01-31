% 6. Hacer un programa que transforme un número entero a binario. 

inicio:- write("ingrese un numero para transformarlo a binario: "), 
    read(Numero), 
    binario(Numero, ResultadoBinario),
    write(ResultadoBinario).

binario(0, 0).
binario(1, 1).

binario(Numero, ResultadoBinario) :-
    Numero > 1,
    Resto is Numero mod 2,      
    NuevoNumero is Numero // 2,
    binario(NuevoNumero, BinarioParcial), 
    ResultadoBinario is BinarioParcial * 10 + Resto. 

/*
    * Numero > 1
    Esta condición verifica si el número que se está convirtiendo a binario es mayor que 1. 
    Si es 0 o 1, se utiliza uno de los casos base y no es necesario realizar más divisiones.

    * Resto is Numero mod 2
    Calcula el RESTO de la división de Numero por 2. 
    Esto es esencialmente el dígito menos significativo del número binario 
    que estamos construyendo.

    * NuevoNumero is Numero // 2
    Realiza la división entera de Numero por 2 para obtener el cociente, 
    que es el número que se convertirá en la siguiente llamada recursiva.

    * binario(NuevoNumero, BinarioParcial)
    Llamada recursiva a binario/2 con el nuevo número (NuevoNumero). 
    Esto construye la parte binaria correspondiente al cociente de la división actual.

    * ResultadoBinario is BinarioParcial * 10 + Resto
    Combina la parte binaria obtenida de la llamada recursiva (BinarioParcial) 
    con el resto de la división inicial (Resto). 
    Multiplicar BinarioParcial por 10 agrega un lugar en la posición de las unidades, 
    y luego se suma el Resto. Esto efectivamente concatena el dígito binario actual 
    al número binario parcial obtenido de la llamada recursiva.
*/