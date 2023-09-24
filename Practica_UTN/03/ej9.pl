inicio:- 
    write('Ingrese una cadena: '), 
    read(Cadena),
    contador(Cadena, Va, Ve, Vi, Vo, Vu, Consonantes),
    write('Vocales: '), write(Va), nl, write(Ve), nl, write(Vi), nl, write(Vo), nl, write(Vu), nl,
    write('Consonantes: '), write(Consonantes), nl.

contador('', 0, 0, 0, 0, 0, 0).

contador(Cadena,Va,Ve,Vi,Vo,Vu,Cc):- 
    sub_atom(Cadena,0,1,_,'a'), 
    sub_atom(Cadena,1,_,0,Subcadena), 
    contador(Subcadena,ContadorA,Ve,Vi,Vo,Vu,Cc), 
    Va is ContadorA + 1.

contador(Cadena, Va, Ve, Vi, Vo, Vu, Cc):- 
    sub_atom(Cadena, 0, 1, _, 'e'), 
    sub_atom(Cadena, 1, _, 0, Subcadena), 
    contador(Subcadena, Va, ContadorE, Vi, Vo, Vu, Cc), 
    Ve is ContadorE + 1.

contador(Cadena, Va, Ve, Vi, Vo, Vu, Cc):- 
    sub_atom(Cadena, 0, 1, _, 'i'), 
    sub_atom(Cadena, 1, _, 0, Subcadena), 
    contador(Subcadena, Va, Ve, ContadorI, Vo, Vu, Cc), 
    Vi is  ContadorI+ 1.

contador(Cadena, Va, Ve, Vi, Vo, Vu, Cc):- 
    sub_atom(Cadena, 0, 1, _, 'o'), 
    sub_atom(Cadena, 1, _, 0, Subcadena), 
    contador(Subcadena, Va, Ve, Vi, ContadorO, Vu, Cc), 
    Vo is ContadorO + 1.

contador(Cadena, Va, Ve, Vi, Vo, Vu, Cc):- 
    sub_atom(Cadena, 0, 1, _, 'u'), 
    sub_atom(Cadena, 1, _, 0, Subcadena), 
    contador(Subcadena, Va, Ve, Vi, Vo, ContadorU, Cc), 
    Vu is ContadorU + 1.

% Como ya valido arriba las vocales, aca encuentre lo q encuentre suma 1.
contador(Cadena,Va,Ve,Vi,Vo,Vu,Cc):- 
    sub_atom(Cadena,0,1,_,_), 
    sub_atom(Cadena,1,_,0,Subcadena), 
    contador(Subcadena,Va,Ve,Vi,Vo,Vu,ContadorC), 
    Cc is ContadorC + 1.

