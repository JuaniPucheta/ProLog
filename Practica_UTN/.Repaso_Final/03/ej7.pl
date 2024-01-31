% Hacer un reconocedor de palabras de la forma a^n . b^n
%? Ejemplo: 'aabb' misma ^n. 'aaaab' distinta ^b 

inicio :-     
    write("Ingrese una cadena: "), 
    read(Cadena),
    cantidad(Cadena, ContA, ContB),
    ContA == ContB,
    write("Corresponde, misma ^n").

cantidad(Cadena, 0, 0):- 
    atom_length(Cadena, 0).
    
cantidad(Cadena, CantidadA, CantidadB):-  
    sub_atom(Cadena, 0, 1, _, 'a'),
    sub_atom(Cadena, 1, _, 0, Sub),
    cantidad(Sub, CA, CantidadB),
    CantidadA is CA + 1.

cantidad(Cadena, CantidadA, CantidadB):-  
    sub_atom(Cadena, 0, 1, _, 'b'),
    sub_atom(Cadena, 1, _, 0, Sub),
    cantidad(Sub, CantidadA, CB),
    CantidadB is CB + 1.
