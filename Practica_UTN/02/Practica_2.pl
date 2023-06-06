%EJERCICIO 1
inicio1:-write('Ingrese los elementos de la lista'),nl,leer(LISTA),nl,nl,write(LISTA).

leer([H|T]):-read(H),H\=[],leer(T).
leer([]).

%EJERCICIO 2
inicio2:-write('Ingrese los elementos de la lista'),nl,leer([Cab|Col]),nl,nl,write('Cabeza: '),write(Cab),write(' Cola: '),write(Col).

%EJERCICIO 4
inicio4:-write('Ingrese los elementos de la lista'),nl,leer([E1|[E2|_]]),nl,nl,write('Primer elemento: '),write(E1),write(' Segundo elemento: '),write(E2).

%EJERCICIO 5
inicio5:-write("Ingrese los elementos de la lista"),nl,leer5(H),
	sacarUltimo(H,Ultimo),nl,write('Ultimo elemento: '),write(Ultimo).
leer5([H|T]):-read(H),H\=[],leer5(T).
leer5([]).

sacarUltimo([H|[]],H).
sacarUltimo([_|T],U):-sacarUltimo(T,U).

%EJERCICIO 6
inicio6:-write("Ingrese lista de numeros enteros:"),nl,leer(H),restarPyU(H,Res),nl,write('Diferencia entre primer y ultimo elemento: '),write(Res).

restarPyU([H|T],Res):-obtenerUltimo([H|T],Ult),Res is H-Ult.
obtenerUltimo([H|[]],H).
obtenerUltimo([_|T],U):-obtenerUltimo(T,U).

%-EJERCICIO 7
inicio7:-write("Ingrese lista de elementos:"),nl,leer(Lista),contar(Lista,Cant),write('Cantidad de elementos ingresados: '),write(Cant).

contar([],0).
contar([_|T],C):-contar(T,CantCola),C is 1+CantCola.

%EJERCICIO 8
inicio8:-write("Ingrese lista de numeros enteros:"),nl,leer(H),sumatoria(H,Sum),write("la sumatoria de los numeros ingresados es: "),write(Sum).

sumatoria([],0).
sumatoria([H|T],Sum):-sumatoria(T,SumResto),Sum is H+SumResto.

%EJERCICIO 9
inicio9:-write("Ingrese lista de numeros enteros:"),nl,leer(Lista),promedio(Lista,Sumatoria,Cantidad),Prom is Sumatoria/Cantidad,write('El promedio de los numeros ingresados es: '),write(Prom).
promedio(L,S,C):-sumatoria(L,S),contar(L,C).

%EJERCICIO 10
inicio10:-write("Ingrese lista de elementos:"),nl,leer(Lista),write("Ingrese elemento"),read(E),pertenece(E,Lista),write("El elemento está en la lista").
inicio10:-write("El elemento no está en la lista").

pertenece(E,[E|_]).
pertenece(E,[_|T]):-pertenece(E,T).

%EJERCICIO 11
inicio11:-write("Ingrese lista de numeros enteros:"),nl,leer([H|T]),mayor(T,H,Max),write("El mayor es: "),write(Max).

mayor([],M,M).
mayor([H|T],M,Max):-H>M,mayor(T,H,Max).
mayor([_|T],M,Max):-mayor(T,M,Max).

%EJERCICIO 12
inicio12:-write("Ingrese lista de numeros enteros:"),nl,leer([H|T]),menor(T,H).
menor([],T):-write("El menor es "),write(T).
menor([H|T],M):-H<M,menor(T,H).
menor([_|T],M):-menor(T,M).

%EJERCICIO 13
inicio13:-write("Ingrese la primer lista de elementos:"),nl,leer(Lista1),write("Ingrese la segunda lista de elementos:"),nl,leer(Lista2),concatenar(Lista1,Lista2,Lista3),write("La lista concatenada es: "),write(Lista3).

concatenar([],[],[]).
concatenar([H1|T1],L2,[H1|T3]):-concatenar(T1,L2,T3).
concatenar([],[H2|T2],[H2|T3]):-concatenar([],T2,T3).

%EJERCICIO 17
persona(tota,[funes,rosario,maeame]).
persona(juan,[funes,rosario,"San Nicolas"]).


visito(Persona,Ciudad):-persona(Persona,Lista),pertenece(Ciudad,Lista).
