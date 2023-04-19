%2. Teniendo la siguiente base de hechos, definir una regla que permita determinar quienes hablan 
% el idioma inglés y francés.

conoce(franco,ingles). 
conoce(renzo,ingles). 
conoce(franco,frances). 
conoce(renzo,frances). 
conoce(franco,italiano). 
conoce(marco,ingles). 
conoce(omar,ingles).
conoce(maria,frances).

%? REGLA:
es_hablado(Idioma,Persona):-conoce(Persona,Idioma).

/* %! ALGUNOS RESULTADOS:
    ?- es_hablado(ingles,franco).
    true.

    ?- es_hablado(ingles,renzo).
    true.

    ?- es_hablado(ingles,marco).
    true.

    ?- es_hablado(ingles,omar).
    true.

    ?- es_hablado(ingles,maria).
    false.
*/