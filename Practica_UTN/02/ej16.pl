%  Ingresar una lista y un elemento e informar cuántas veces está ese elemento en la lista.
%! MUY PEDIDO EN EXAMENES

inicio:- write("Ingrese una lista: "), 
    leer(Lista), 
    write("Ingrese un elemento: "), 
    read(Elemento), 
    contar(Lista, Elemento, Cantidad), 
    write("El elemento "), write(Elemento), 
    write(" aparece "), write(Cantidad), write(" veces en la lista ").

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

contar([], _, 0).
contar([H|T], E, C):- 
    H = E, 
    contar(T, E, C1),
    C is C1 + 1.
contar([H|T], E, C):-
    H \= E,
    contar(T, E, C).

/*
    ? inicio/0: Este es el predicado principal que inicia el proceso. Realiza lo siguiente:
    * Solicita al usuario ingresar una lista de elementos y almacena esa lista en la variable Lista.
    * Solicita al usuario ingresar un elemento y almacena ese elemento en la variable Elemento.
    * Llama al predicado contar/3 para determinar cuántas veces aparece el Elemento en la Lista.
    * Muestra un mensaje indicando cuántas veces aparece el elemento en la lista.

    ? leer/1: Este predicado se encarga de leer una lista de elementos desde la entrada estándar. Utiliza recursión para ir leyendo los elementos uno por uno y construir la lista.
    ? contar/3: Este predicado cuenta cuántas veces aparece un elemento dado en una lista. Tiene tres cláusulas:
    * Si la lista está vacía, el contador es 0.
    * Si el primer elemento de la lista (H) es igual al elemento a contar (E), se llama recursivamente a contar/3 con el resto de la lista (T) y el contador actualizado (C1). Luego, se incrementa el contador en 1 (C is C1 + 1).
    * Si el primer elemento de la lista (H) no es igual al elemento a contar (E), se llama recursivamente a contar/3 con el resto de la lista (T) y el mismo contador (C), ya que no hay coincidencia.
*/

