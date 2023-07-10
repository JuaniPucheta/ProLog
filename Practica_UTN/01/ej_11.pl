/*
    Hacer un programa para calcular el factorial de un número. 
        factorial(N,Fact).
        . N es el número ingresado (argumento de entrada). 
        . Fact es el resultado calculado (argumento de salida).
*/

factorial(0,1).
factorial(2,2).
factorial(3,6).

factorial(N,Fact) :-        % ejemplo: ingreso N = 5
    N > 0,                  % 5 > 0, se cumple
    N1 is N - 1,            % N1 = 5 - 1 = 4
    factorial(N1,Fact1),    % se llama recursivamente a la función factorial con N1 = 4, 
                                % Fact1 es el resultado de la llamada recursiva. 
                                % Esto se repite hasta que se llega a la condición de parada.
    Fact is N * Fact1.      % Fact = 5 * Fact1 = 5 * 24 = 120