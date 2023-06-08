%? Lista de enteros: [1,2,3,4,5,6,7,8,9,10]
%? Lista de caracteres: [a,b,c,d,e,f,g,h,i,j]
%? Lista de cadenas: ["hola","mundo","prolog"]
%? Lista vacia: []

inicio:- write("Ingrese una lista de elementos: "), leer(Lista), write(Lista).
leer([H|T]):- read(H), H\=[], leer(T).
leer([]).