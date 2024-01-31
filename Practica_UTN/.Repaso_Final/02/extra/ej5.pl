% Listar por pantalla los hijos de una madre y un padre

%* FORMA 1
% Luego de mostrar cada hijo forzamos el backtracking con el predicado fail

listarHijos(P, M) :- 
    padres(H, M, P),
    write(H),
    fail.
listarHijos(_,_).