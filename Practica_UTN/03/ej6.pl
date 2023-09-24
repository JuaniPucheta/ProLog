% 6. Hacer un programa que transforme un número entero a binario. 


inicio:- write("ingrese un numero para transformarlo a binario: "), 
    read(Numero), 
    binario(Numero, NumeroBinario),
    write(NumeroBinario).

binario(0, 0).
binario(1, 1).  % 1, Binario (entra cuando el numero es 1)

binario(Numero, NumeroBinario) :- % 4, Binario || 2, Binario || 1, Binario
    Numero > 1, % true || true || binario(1, 1)
    Cociente is Numero // 2, % Cociente = 2 || Cociente = 1 
    Resto is Numero mod 2, % Resto = 0 || Resto = 0 
    binario(Cociente, Binario), % binario(2, Binario) || binario(1, Binario) -- binario(1, 1) || binario(2, 10) 
    atom_concat(Binario, Resto, NumeroBinario). %-- (1, 0, 10) || (10, 0, 100)


