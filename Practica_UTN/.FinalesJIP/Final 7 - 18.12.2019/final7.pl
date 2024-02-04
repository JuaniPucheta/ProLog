/*
    - docente(dni,nombre,edad,telefono,direccion,ciudad).
    - colegio(nombreColegio,direccion,ciudad).
    - colegio_docentes(nombreColegio,dni,[listaMaterias]).

    Un docente podía trabajar en distintos colegios y dar diferentes materias según el colegio.

######################################################### Fue el parcial que mas nos complico (Ambos items) #############################################################

    1) Listar todos los docentes que trabajen en al menos 2 colegios diferentes 
        de la ciudad de Rosario. 
    
    2) Ingresar una lista de docentes y una lista de colegios 
        y devolver una tercer lista con los docentes 
        que pertenezcan a los colegios ingresados anteriormente.
*/

:- dynamic docente/6.
:- dynamic colegio/3.
:- dynamic colegio_docentes/3.
:- discontiguous opcion/1.

abrir_base :-
    retractall(docente(_,_,_,_,_,_)),
    retractall(colegio(_,_,_)),
    retractall(colegio_docentes(_,_,_)),
    consult('final7.txt').

inicio :-
    abrir_base, nl,
    writeln('=========================================='),
    writeln('Opcion 1 - Listado de docentes que trabajan en +2 colegios diferentes de rosario.'),
    writeln('Opcion 2 - Lista de docentes que pertenezcan a los colegios ingresados.'),
    writeln('Opcion 3 - Salir'),
    writeln('=========================================='),
    read(Opcion),
    Opcion \= 3,
    opcion(Opcion),
    inicio.
inicio.

%TODO --> consultar | es muy raro como se resuelve (quise hacer con contador [H|T] y no sirvio)
opcion(1):-
    buscarDocentes.

    buscarDocentes:-
        %---------------------------------------
        docente(Dni,Nombre,_,_,_,_), 
        retract(docente(Dni,Nombre,_,_,_,_)),
        colegio_docentes(Nom_cole1,Dni,_), 
        retract(colegio_docentes(Nom_cole1,Dni,_)),         
        colegio(Nom_cole1,_,'rosario'),
        %-----Hasta aca, un colegio-------------
        
        %-------Busco otro colegio--------------
        colegio_docentes(Nom_cole2,Dni,_), 
        retract(colegio_docentes(Nom_cole2,Dni,_)),  
        colegio(Nom_cole2,_,'rosario'), nl,
        %---Si pasa, entonces el Dni esta para 2 colegios
        
        write('Docente: '), write(Nombre),
        buscarDocentes.
    buscarDocentes.

opcion(2) :-
    write('Ingrsar una lista de docentes: '), leer(ListaDocentes),
    write('Ingresar una lista de colegios: '), leer(ListaColegios),
    docentes_pertenecen(ListaDocentes, ListaColegios, ListaPertenecen), nl,
    write('Docentes que pertenecen a los colegios ingresados: '), write(ListaPertenecen), nl.

    leer([H|T]) :- read(H), H \= [], leer(T).
    leer([]).

    docentes_pertenecen([], _, []).

    docentes_pertenecen([H|T], ListaColegio, [H|T1]) :-
        docente(Dni, H, _, _, _, _),
        % retract(docente(Dni, H, _, _, _, _)),
        colegio_docentes(Colegio, Dni, _),
        retract(colegio_docentes(Colegio, Dni, _)),
        pertenece(Colegio, ListaColegio),
        docentes_pertenecen(T, ListaColegio, T1).

    docentes_pertenecen([_|T], ListaColegio, T1) :-
        docentes_pertenecen(T, ListaColegio, T1).

        pertenece(X, [X|_]).
        pertenece(X, [_|T]) :- pertenece(X, T).
