/*
? REGLAS
    * El elefante es mas grande que el caballo
    * El caballo es mas grande que el perro
    * El perro es mas grande que el raton
    * El oso es mas grande que el perro y que el gato
*/

masgrande(elefante,caballo).
masgrande(caballo,perro).
masgrande(perro,raton).
masgrande(oso,perro,gato).