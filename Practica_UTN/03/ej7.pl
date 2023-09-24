%? el contador en linea 20 y 29 esta arriba en vez de abajo porque si no no funciona

inicio:- 
    write('Ingrese una cadena: '), 
    read(Cadena),
    cantidad(Cadena, ContA, ContB),
    %! ASI NO => cantidad(Cadena, 0, 0, ContA, ContB),
    ContA == ContB,
    write('Corresponde, misma ^n').

  %! ASI NO => cantidad(Cadena, CantidadA, CantidadB, CantidadA, CantidadB):- % cadena 0 0
cantidad(Cadena, 0, 0):- 
  %! ASI NO => atom_length(Cadena, Cant), % cadena 0
  atom_length(Cadena, 0).

cantidad(Cadena, CantidadA, CantidadB):-  
  sub_atom(Cadena,0,1,_,'a'),
  sub_atom(Cadena,1,_,0,SubCadena),
  cantidad(SubCadena, CantA, CantidadB),
  CantidadA is CantA + 1.

cantidad(Cadena, CantidadA, CantidadB):-  
  sub_atom(Cadena,0,1,_,'b'),
  sub_atom(Cadena,1,_,0,SubCadena),  
  cantidad(SubCadena, CantidadA, CantB),
  CantidadB is CantB + 1.
