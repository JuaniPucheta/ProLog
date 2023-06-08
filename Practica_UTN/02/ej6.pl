% Ingresar una lista de números enteros y 
% calcular la diferencia entre el primero y el último de ellos.

inicio :- 
    write("Ingrese una lista de numeros enteros: "), 
    leer(Lista),
    write(Lista),
    primero(Lista, Primero)
    ultimo(Lista, Ultimo), 
    diferencia(Primi, Ult),
    write("La diferencia es: "),
    write()