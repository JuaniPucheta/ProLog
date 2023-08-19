%Ingresar una lista de enteros e informar cuál es el menor de todos los números.

inicio:- write('Ingrese una lista de enteros: '), 
    leer([H|T]), 
    menor([H|T], H, Menor), 
    write('El menor de todos los numeros es: '), 
    write(Menor).

leer([H|T]):- read(H), H\=[], leer(T).
leer([]).

menor([], Me, Me).
menor([H|T], Me, Menor):- H < Me, menor(T, H, Menor).
menor([_|T], Me, Menor):- menor(T, Me, Menor).
