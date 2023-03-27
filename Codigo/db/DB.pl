/*
    TODO--> Bases de datos con programacion logica

    * Los lenguajes de consulta de bases de datos relacionales estan basados en logica
        * de predicados de primer orden, al igual que ProLog

    * Los datos representados mediante tablas en las BD's relacionales, se pueden 
        * representar en ProLog mediante un conjunto de hechos

    * Las operaciones que se pueden realizar son: proyeciones, uniones, diferencias, productos, intersecciones, etc.
*/

%? Tabla de proveedores, clave, nombre del proveedor, pais, calificacion
proveedores(p1,luis,mexico,10).
proveedores(p2,alicia,usa,10).
proveedores(p3,isabel,españa,9).
proveedores(p4,oscar,brasil,9).
proveedores(p5,juan,españa,8).
proveedores(p6,maria,usa,8).
proveedores(p7,pedro,mexico,7).
proveedores(p8,ana,brasil,7).
proveedores(p9,carlos,españa,6).
proveedores(p10,martha,usa,6).

%? Tabla de productos, clave del producto, descripcion, marca, precio, pais
productos(x1,microfono,br,50,usa).
productos(x2,teclado,br,100,usa).
productos(x3,monitor,br,200,usa).
productos(x4,memoria,br,50,usa).
productos(x5,procesador,br,100,usa).
productos(x6,disco,br,200,usa).
productos(x7,impresora,br,50,usa).
productos(x8,scanner,br,100,usa).
productos(x9,parlantes,br,200,usa).
productos(x10,webcam,br,50,usa).

%? Tabla proveedores-productos. Clave de la tabla, clave proveedores, clave productos y cantidad
prov_prod(cve1,p1,x2,100).
prov_prod(cve2,p2,x3,10).
prov_prod(cve3,p3,x8,10).
prov_prod(cve4,p4,x8,20).
prov_prod(cve5,p5,x7,30).
prov_prod(cve6,p5,x5,5).
prov_prod(cve7,p10,x3,1).
prov_prod(cve8,p7,x3,100).

%* Seleccionar la clave del proveedor
seleccionarClaveProv(X):- proveedores(X,_,_,_). % X es la clave del proveedor, el resto de los argumentos no importan 
    %! En swi-prolog --> seleccionarClaveProveedor(X), write(X), nl, fail.  (Para ver todos los resultados)

%* Seleccionar la clave del proveedor siempre y cuando sea de mexico
seleccionarClaveProvMexico(X):- proveedores(X,_,mexico,_). % X es la clave del proveedor, el resto de los argumentos no importan 
    %! En swi-prolog --> seleccionarClaveProveedorMexico(X), write(X), nl, fail.  (Para ver todos los resultados)

%* Seleccionar la clave del proveedor y nombre que tenga calificacion mayor a 8
seleccionarClaveProvCalif(X,Y,Z):- proveedores(X,_,Y,Z), Z > 8. % X es la clave del proveedor, Y es el nombre del proveedor, Z es la calificacion
    %! En swi-prolog --> seleccionarClaveProveedorCalif(X,Y), write(X), write(' '), write(Y), nl, fail.  (Para ver todos los resultados)

%* Seleccionar la clave del proveedor que no haya suministrado productos
seleccionarClaveProvNoSuministro(X):- proveedores(X,_,_,_), not(prov_prod(_,X,_,_)). % X es la clave del proveedor, el resto de los argumentos no importan 
    %! En swi-prolog --> seleccionarClaveProveedorNoSuministro(X), write(X), nl, fail.  (Para ver todos los resultados)

%* Seleccionar la clave del proveedor que haya suministrado productos
intersectar(Clave):- proveedores(Clave,_,_,_), prov_prod(_,Clave,_,_). % Clave es la clave del proveedor, el resto de los argumentos no importan 
    %! En swi-prolog --> intersectar(X), write(X), nl, fail.  (Para ver todos los resultados)

%* Seleccionar la clave del proveedor y producto x3
intersectar2(ClaveProv, Prod):- proveedore(ClaveProd,_,_,_), prov_prod(_,ClaveProd,Prod,_), Prod = x3. % ClaveProv es la clave del proveedor, Prod es la clave del producto
    %! En swi-prolog --> intersectar2(X,Y), write(X), write(' '), write(Y), nl, fail.  (Para ver todos los resultados)