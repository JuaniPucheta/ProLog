:- dynamic libro/5.
:- discontiguous opcion/1.  % quitamos warning

abrir_base:- 
    retractall(libro(_,_,_,_,_)), 
    consult("db5.txt").

guardar_base:- tell('db5.txt'), listing(libro), told. 

menu:- 
    abrir_base, nl,
    write("Opcion 1 - Consulta libro"), nl,
    write("Opcion 2 - Alta libro"), nl,
    write("Opcion 3 - Baja libro"), nl,
    write("Opcion 4 - Precio promedio libros - autor"),
    write("Opcion 0 - Salir "),
    nl,
    read(Opcion),
    Opcion\=0,
    opcion(Opcion),
    menu.
menu.

opcion(1):- 
  write("Ingrese el nombre del libro: "),
  read(Libro),
  buscar_libro(Libro).

buscar_libro(Libro):-
  libro(Nro, Libro, Autor, Editorial, Precio),
  write("Nro de libro: "), write(Nro), nl,
  write("Nombre de libro: "), write(Libro), nl,
  write("Autor: "), write(Autor), nl,
  write("Editorial: "), write(Editorial), nl,
  write("Precio: "), write(Precio), nl,
  retract(libro(Nro, Libro, Autor, Editorial, Precio)).

opcion(2):- 
  alta_libro.

alta_libro:-
  ultimo_libro(0, Numero),
  N is Numero + 1,
  write("Ingrese el nombre del libro: "),
  read(Libro),
  write("Ingrese el autor: "),
  read(Autor),
  write("Ingrese la editorial: "),
  read(Editorial),
  write("Ingrese el precio: "),
  read(Precio),

  % Descarto todo lo que borramos en el retract del ultimo_libro
  abrir_base, 

  assert(libro(N, Libro, Autor, Editorial, Precio)),
  guardar_base.

ultimo_libro(Numero, NFinal):-
  libro(Nro, _, _, _, _),
  Nro > Numero, N is Nro,
  retract(libro(N, _, _, _, _)),
  ultimo_libro(Nro, NFinal).

ultimo_libro(Numero, Numero).

opcion(3):- 
  write("Ingrese el nombre del libro: "),
  read(Libro),
  borrar_libro(Libro).

borrar_libro(Libro):-
  retract(libro(_, Libro, _, _, _)),
  guardar_base,
  write("Libro borrado"), nl.

borrar_libro(Libro):-
  write("No se encontro el libro: "), write(Libro), nl. 

opcion(4):- 
  write("Ingrese el autor: "),
  read(Autor),
  precio_promedio(Autor, Cant, Tot),
  Promedio is Tot/Cant,
  write("El promedio es: "), write(Promedio).

precio_promedio(Autor, Cantidad, Total):-
  libro(_, _, Autor, _, Precio),
  retract(libro(_, _, Autor, _, Precio)),
  precio_promedio(Autor, CantidadAnterior, TotalAnterior),
  Cantidad is CantidadAnterior + 1,
  Total is TotalAnterior + Precio.
  
precio_promedio(_, 0, 0).