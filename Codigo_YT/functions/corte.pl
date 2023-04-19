/*
    ? El corte permite decirle a Prolog cuales son las opciones previas que no hace falta
    ? que vuelva a considerar en un posible proceso de reevaluacion. 
    ? Se aplica mediante el siguiente simbolo: 

    ? ¿En qué casos utilizar el corte?
    *   1. Para optimizar la ejecución.
    *   2. Para facilitar la legibilidad y comprensión del algoritmo que está siendo programado
    *   3. Para implementar algoritmos diferentes según la combinación de argumentos de entrada
    *   4. Para conseguir que un predicado solamente tenga una solución.
    ? ---------------------------------------------------------------------------------------
*/

/* 
*   Biblioteca
*   Los servicios de consulta son servicios básicos
*/
servicio_basico(consulta_BD).
servicio_basico(consulta_Interna).

/* Los servicios de prestamo son servicios adicionales */
servicio_adicional(prestamo_interno).
servicio_adicional(prestamo_externo).

/* Los servicios completos estan compuestos por el servicio basico y el servicio adicional */
servicio_completo(X) :- servicio_basico(X).
servicio_completo(X) :- servicio_adicional(X).

/* Si un socio tiene un libro prestado, se le ofrecen solo los servicios basicos */
servicio(Socio, Servicio) :- prestado(Socio,_), !,
	servicio_basico(Servicio).

/* A los socios que no tengan prestado un libro, se les ofrece todos los servicios */
servicio(_,Servicio) :- servicio_completo(Servicio).

/* ---Ejemplo--- */
socio(alex).
socio(juan).
socio(alicia).

prestado(alex, clave1).
prestado(juan, clave2).
/* ----------------- */