/*
    Ingresar una lista de nros y un nro aparte. Después hacer sumatoria de todos 
    los numeros de la lista que sean mayores al número ingresado aparte 
    en 2 unidades. Luego mostrar los nros pares de la lista.
*/

inicio:-write("Ingrese una lista de numeros: "), leer(Lista),
    write("Ingrese un numero aparte: "), read(Nro),
    sumatoria(Lista, Nro, Suma),
    write("La sumatoria de los numeros mayores a "), write(Nro), write(" en 2 unidades es: "), write(Suma), nl,
    write("Los numeros pares de la lista son: "), nl,
    mostrarPares(Lista).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

sumatoria([], _, 0).
sumatoria([H|T], Nro, Suma):- 
    H > Nro + 2, 
    sumatoria(T, Nro, Suma1), 
    Suma is H + Suma1.
sumatoria([_|T], Nro, Suma):- sumatoria(T, Nro, Suma).

mostrarPares([]).
mostrarPares([H|T]):- 
    0 is H mod 2, 
    write(H), nl, 
    mostrarPares(T).
mostrarPares([_|T]):- mostrarPares(T).

/*
    Ingresar una lista de números y un numero aparte. Agregar a una lista distinta
    los números de la primer lista que son dividendos del valor ingresado aparte. 
    Después decir cuantos de los dividendos superan en al menos n unidades 
    (numero que se ingresa) al ingresado en el primer apartado.
*/

inicio2 :- write("Ingrese una lista de numeros: "), leer(Lista),
    write("Ingrese un numero aparte: "), read(Nro),
    divisores(Lista, Nro, Divisores),
    write("Los numeros de la lista que son divisores de "), write(Nro), write(" son: "), nl,
    mostrarLista(Divisores), nl,
    write("Ingrese un numero aparte: "), read(Nro2),
    superan(Divisores, Nro2, Nro, Superan),
    write("La cantidad de numeros que superan en al menos "), write(Nro2), write(" unidades a "), write(Nro), write(" es: "), write(Superan).

leer([H|T]) :- read(H), H \= [], leer(T).
leer([]).

divisores([], _, []).
divisores([H|T], Nro, [H|T2]):- 0 is Nro mod H, divisores(T, Nro, T2).
divisores([_|T], Nro, T2):- divisores(T, Nro, T2).

mostrarLista([]).
mostrarLista([H|T]):- write(H), nl, mostrarLista(T).

superan([], _, _, 0).
superan([H|T], Nro2, Nro, Superan):- 
    H > Nro + Nro2, 
    superan(T, Nro2, Nro, Superan1), 
    Superan is 1 + Superan1.
superan([_|T], Nro2, Nro, Superan):- superan(T, Nro2, Nro, Superan).

