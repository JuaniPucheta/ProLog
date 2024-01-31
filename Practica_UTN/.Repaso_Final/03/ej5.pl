% Transformar una cadena de texto en una lista de palabras, tomando como divisor el espacio

%TODO --> consultar

inicio:- 
    write("Ingrese una cadena: "), read(Cadena), 
    separar(Cadena, L), nl,
    write("La cadena queda: "), write(L).

separar(Cadena, [H|T]):- 
    sub_atom(Cadena, P, _, _, '_'),     
        %* busca la posicion del 1er elemento
    sub_atom(Cadena, 0, P, _, H),        
        %* en H almacena desde el inicio 0 hasta la posicion P. Esta es la primera palabra
    Pos is P + 1,
        %* calcula la posicion siguiente despues del espacio encontrado
    sub_atom(Cadena, Pos, _, 0, K), 
        %* genera la subcadena K desde Pos hasta el final y luego llama recursividad 
    separar(K, T).

separar(Cadena, [Cadena|[]]).
