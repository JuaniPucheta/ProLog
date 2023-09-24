

inicio:- write("Ingrese una cadena de texto: "), 
    read(Cadena), 
    transformar(Cadena, ListaPalabras), 
    write(ListaPalabras).

transformar('', []).
transformar(Cadena, [Palabra|Resto]):- 
    sub_atom(Cadena, 0, Indice, _, ' '),    
    sub_atom(Cadena, 0, Indice, _, Palabra), 
    sub_atom(Cadena, Indice, 1, _, ' '),    
    sub_atom(Cadena, Indice, _, _, RestoCadena), 
    transformar(RestoCadena, Resto).        

transformar(Cadena, [Cadena]) :- Cadena \= ''. 
