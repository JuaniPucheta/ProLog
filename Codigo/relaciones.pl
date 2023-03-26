/* Hechos. Sobre personas que tienen objetos personales. */
tiene(maria,libro).
tiene(juan,libreta).
tiene(juan,libro).

/* Hechos, sobre personas que les gustan a otras personas.  */
le_gusta(juan,maria).
le_gusta(maria,juan).
le_gusta(laura,luis).

/*
    El operador AND es con ","
    El operador OR es con ";"
*/