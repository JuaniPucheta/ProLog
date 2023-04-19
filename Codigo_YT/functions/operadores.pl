/* Regla para calcular el cuadrado de un numero dado */
cuadrado(X, Resul):- Resul is X * X.

/* Regla para calcular el promedio de dos numeros dados */
promedio(X,Y,Resul):- Resul is (X+Y)/2.

/* Regla para calcular el factorial de un numero dado	*/
factorial(0,1).
factorial(Numero, Resul):- 
	Num is Numero - 1, 
	factorial(Num, Resul2), 
	Resul is Num*Resul2.

/* Regla para trabajar con el maximo de dos numeros dados */
max(X,Y,X):- X>=Y.
max(X,Y,Y):- Y>=X.