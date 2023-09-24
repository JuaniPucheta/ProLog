inicio:- 
    write('Ingrese una cadena: '), 
    read(Cadena),
    write('Ingrese el caracter: '), 
    read(Caracter),
    buscador(Cadena, Caracter, Cont),
    write('Aparece: '), write(Cont).
   
   buscador('',_, 0).
  
  buscador(Cadena, Caracter, C):- 
    sub_atom(Cadena, Pos, _, _, Caracter), 
    Pos1 is Pos + 1,
    atom_length(Cadena, Largo),
    CantRes is Largo - Pos1,
    sub_atom(Cadena, Pos1, CantRes, _, SubCadena),
    buscador(SubCadena, Caracter, CAnt),
    C is CAnt + 1.
