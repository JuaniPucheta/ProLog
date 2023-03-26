/* 
    Notacion
        => [X | _] (cabeza)
        => [_ | X] (cola)
*/

/* Miembro(Elem,Lista) <- el termino Elem pertenece a la Lista */
miembro(X, [X | _]).
miembro(X, [_ | Y]) :- miembro(X,Y). 