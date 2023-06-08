/*
    Escribir un programa que simule una calculadora para las operaciones matemáticas básicas 
    (suma, resta, multiplicación y división) entre dos valores numéricos, informando el resultado.
*/

%hechos
% suma(A,B,R) :- R is A + B.
% resta(A,B,R) :- R is A - B.
% multiplicacion(A,B,R) :- R is A * B.
% division(A,B,R) :- R is A / B.

menu :- writeln('Ingrese el primer numero: '), read(N1),
        writeln('Ingrese el segundo numero: '), read(N2),
        writeln('Ingrese la operacion a realizar: '), 
        writeln('1. Suma'),
        writeln('2. Resta'),
        writeln('3. Multiplicacion'),
        writeln('4. Division'),
        writeln('5. Salir'),
        read(Opcion),
        Opcion \= 5,    % funciona como un if, si es distinto de 5, hace lo de abajo
        operacion(Opcion, N1, N2),
        menu.
menu :- writeln('Fin del programa').

operacion(1, N1, N2) :- Suma is N1 + N2, write('El resultado es: '), writeln(Suma).
operacion(2, N1, N2) :- Resta is N1 - N2, write('El resultado es: '), writeln(Resta).
operacion(3, N1, N2) :- Multiplicacion is N1 * N2, write('El resultado es: '), writeln(Multiplicacion).
operacion(4, N1, N2) :- Division is N1 / N2, write('El resultado es: '), writeln(Division).
operacion(_, _, _) :- writeln('Opcion invalida').
