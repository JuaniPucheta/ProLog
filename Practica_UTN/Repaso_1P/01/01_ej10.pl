/*
    Dada la siguiente red de tareas de un proyecto:
    A(6) --> C(4) --> D(5)
    B(3) --> D(5)
    B(3) --> F(7) --> G(4) --> J(2)
    D(5) --> E(4) --> H(5) --> J(2)
    E(4) --> I(2) --> J(2)

    Definir la regla requiere_de(X,Y), la cual permite saber si 
        para la ejecución de la tarea Y se requiere tener finalizada la tarea X.
*/

requiere_de(c,a).
requiere_de(d,c).
requiere_de(d,b).
requiere_de(f,b).
requiere_de(g,f).
requiere_de(j,g).
requiere_de(e,d).
requiere_de(h,e).
requiere_de(j,h).
requiere_de(i,e).
requiere_de(j,i).

requiere(A,B) :- requiere_de(A,B).
requiere(A,B) :- requiere_de(A,C), requiere(C,B).