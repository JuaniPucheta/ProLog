/*
    Escribir un programa que simule una calculadora para las operaciones
    matemáticas básicas (suma, resta, multiplicación y división) entre dos
    valores numéricos, informando el resultado.
*/

menu :- writeln('Ingrese el primer numero: '), read(N1),
        writeln('Ingrese el segundo numero: '), read(N2),
        writeln('Ingrese la operacion a realizar: '), 
        writeln('1. Suma'),
        writeln('2. Resta'),
        writeln('3. Multiplicacion'),
        writeln('4. Division'),
        writeln('5. Salir'),
        read(Opcion),
        Opcion \= 5,    
        operacion(Opcion, N1, N2),
        menu.
menu :- writeln('Fin del programa').

operacion(1, N1, N2) :- Suma is N1 + N2, write('La suma es: '), write(Suma).
operacion(2, N1, N2) :- Resta is N1 - N2, write('La resta es: '), write(Resta).
operacion(3, N1, N2) :- Multi is N1 + N2, write('La multiplicacion es: '), write(Multi).
operacion(4, N1, N2) :- Divi is N1 / N2, write('La división es: '), write(Divi).
operacion(_, _, _).
