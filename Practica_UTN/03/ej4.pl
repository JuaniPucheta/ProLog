% Transformar una cadena en una lista de caracteres

inicio:- write("Ingrese una cadena: "), 
    read(Cadena), 
    transformar(Cadena, Lista), 
    write(Lista).

transformar('', []).    % comillas simples
transformar(Cadena, [H|T]):- sub_atom(Cadena, 0, 1, _, H),
    sub_atom(Cadena, 1, _, 0, Resto),
    transformar(Resto, T).

/*
    ?inicio/0: Este es el punto de entrada del programa. Realiza lo siguiente:
    * Pide al usuario que ingrese una Cadena y la almacena en la variable Cadena.
    * Llama al predicado transformar/2 para transformar la cadena en una lista de caracteres.
    * Muestra la Lista resultante.
    
    ?transformar/2: Este predicado es el corazón del programa y se encarga de transformar una cadena en una lista de caracteres. Tiene dos argumentos: Cadena (cadena de entrada) y Lista (lista de caracteres resultante). Su lógica es:
    * Si la Cadena está vacía (comillas simples), la Lista resultante también está vacía.
    * Si la Cadena no está vacía, utiliza el predicado sub_atom/5 para extraer el primer carácter de la cadena y lo almacena en la variable H. sub_atom/5 toma cinco argumentos: la cadena de entrada, la posición inicial (0 para el primer carácter), la longitud a extraer (1 para un carácter), el offset (se usa _ para ignorar), y la variable donde se almacenará el carácter extraído.
    * Luego, utiliza nuevamente sub_atom/5 para obtener el Resto de la cadena, excluyendo el primer carácter. Toma la cadena de entrada, el índice de inicio (1 para el segundo carácter), la longitud (se usa _ para que se tome la longitud restante), el offset (0 para el último carácter), y la variable donde se almacenará el resto de la cadena.
    * Llama recursivamente a transformar/2 con el Resto como nueva cadena y la cola T de la lista resultante.
*/