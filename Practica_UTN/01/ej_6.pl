/*
    Escribir un programa Prolog que ayude a un organizador a armar un festival, 
        considerando las diferentes bandas de música que se pueden formar en cada ciudad.
    Para formar una banda son necesarios un guitarrista, un cantante y un baterista. 
        Se dispone de la siguiente información: 
            • Carolina y José son guitarristas y viven en Rosario. 
            • Miguel es guitarrista y vive en Funes. 
            • Mariano es un cantante que vive en Rosario. 
            • Silvia es una cantante que vive en Funes. 
            • Eduardo es un baterista que vive en Roldán. 
            • Diego es un baterista que vive en Casilda. 
            • Laura es una baterista que vive en Rosario. 
            • Mauro es cantante y vive en Funes.
    El programa debe responder si en una ciudad (dato de entrada), se puede o no formar una banda.
*/

es_guitarrista_y_vive(carolina,rosario).
es_guitarrista_y_vive(jose,rosario).
es_guitarrista_y_vive(miguel,funes).
es_cantante_y_vive(mariano,rosario).
es_cantante_y_vive(silvia,rosario).
es_cantante_y_vive(mauro,rosario).
es_baterista_y_vive(eduardo,roldan).
es_baterista_y_vive(diego,casilda).
es_baterista_y_vive(laura,rosario).

se_puede(X) :- 
    es_guitarrista_y_vive(_,X),
    es_cantante_y_vive(_,X),
    es_baterista_y_vive(_,X).