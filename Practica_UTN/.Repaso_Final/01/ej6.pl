/*
    Escribir un programa Prolog que ayude a un organizador a armar un
    festival, considerando las diferentes bandas de música que se pueden formar en cada ciudad.
    
    Para formar una banda son necesarios un guitarrista, un cantante y un
    baterista. Se dispone de la siguiente información:
        • Carolina y José son guitarristas y viven en Rosario.
        • Miguel es guitarrista y vive en Funes.
        
        • Mariano es un cantante que vive en Rosario.
        • Silvia es una cantante que vive en Funes.
        • Mauro es cantante y vive en Funes.
        
        • Eduardo es un baterista que vive en Roldán.
        • Diego es un baterista que vive en Casilda.
        • Laura es una baterista que vive en Rosario.
    El programa debe responder si en una ciudad (dato de entrada), se puede o
    no formar una banda. 
*/

es_guitarrista_y_vive_en(carolina, rosario).
es_guitarrista_y_vive_en(jose, rosario).

es_cantante_y_vive_en(mariano, rosario).
es_cantante_y_vive_en(silvia, funes).
es_cantante_y_vive_en(mauro, funes).

es_baterista_y_vive_en(eduardo, roldan).
es_baterista_y_vive_en(diego, casilda).
es_baterista_y_vive_en(laura, rosario).

formar_banda(C) :- es_guitarrista_y_vive_en(_, C), es_cantante_y_vive_en(_, C), es_baterista_y_vive_en(_, C).
