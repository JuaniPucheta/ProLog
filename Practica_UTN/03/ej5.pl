% Transformar una cadena de texto en una lista de palabras, tomando como divisor el espacio

inicio:- write("Ingrese una cadena de texto: "), 
    read(Cadena), 
    transformar(Cadena, ListaPalabras), 
    write(ListaPalabras).

transformar('', []).
transformar(Cadena, [Palabra|Resto]):- 
    sub_atom(Cadena, 0, Indice, _, ' '),    % Buscar espacio en la cadena
    sub_atom(Cadena, 0, Indice, _, Palabra), % Extraer palabra antes del espacio
    sub_atom(Cadena, Indice, 1, _, ' '),    % Saltar el espacio
    sub_atom(Cadena, Indice, _, _, RestoCadena), % Extraer el resto de la cadena
    transformar(RestoCadena, Resto).        % Llamar recursivamente con el resto de la cadena

transformar(Cadena, [Cadena]) :- Cadena \= ''. % Caso base si solo hay una palabra en la cadena
