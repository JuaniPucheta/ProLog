/*
    TODO--> PREDICADOS DE ENTRADA Y SALIDA

    Se utilizan cuando estamos interesados en tener una interaccion entre el programa
    y el usuario, aceptando entradas del usuario y presentando las salidas.

    * Write
    * WriteLn
    * In
    * Read
*/

%* Permite escribir un mensaje en la consola
saludo :- write('Ingresa tu nombre: '), read(N),    %? en swi-prolog --> saludo.
    write('Hola, como estas: '), write(N).

%* Permite leer una lista de numeros y calcular su promedio
promedio :- write('Ingresa el primer numero: '), read(A),   %? en swi-prolog --> promedio.
    write('Ingresa el segundo numero: '), read(B),
    write('Ingresa el tercer numero: '), read(C),
    P is (A+B+C)/3,
    write('El promedio es: '), write(P).

cuadrados:- repeat,                 %? en swi-prolog --> cuadrados.
            leeNumero(X), 
            procesa(X), 
            !.

leeNumero(X):- repeat,              % repite hasta que se cumpla la condicion
                write('Numero? '),
                read(X),
                number(X),          % verifica que sea un numero
                !.                  % termina el ciclo si se cumple la condicion

procesa(0) :- !.                % si es 0, termina el ciclo
procesa(X) :- R is X*X,         % calcula el cuadrado
    writeln([X, '^2 = ', R]),   % imprime el resultado en la consola 
    fail.                       % falla para que se repita el ciclo