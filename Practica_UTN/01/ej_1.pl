%? Teniendo la siguiente base de Hechos...
observa(maria,omar). 
observa(laura,omar). 
observa(maria,flavio). 
observa(gabriela,flavio). 
observa(maria,carlos).

%? Ejecutar las siguientes preguntas al Prolog y analizar la respuesta dada en cada caso.
% observa(maria,flavio). 
% observa(maria,Quien). 
% observa(maria,_). 
% observa(Quien,flavio). 
% observa(Quien1,Quien2).
% observa(_,_). 

/*  %! RESPUESTAS:
    a. observa(maria,flavio).
        true.
    
    b. observa(maria,Quien).
        Quien = omar ;
        Quien = flavio ;
        Quien = carlos ;
        false.

    c. observa(maria,_).
        true.

    d. observa(Quien,flavio).
        Quien = maria ;
        Quien = gabriela ;
        false.

    e. observa(Quien1,Quien2).
        Quien1 = maria,
        Quien2 = omar ;
        Quien1 = laura,
        Quien2 = omar ;
        Quien1 = maria,
        Quien2 = flavio ;
        Quien1 = gabriela,
        Quien2 = flavio ;
        Quien1 = maria,
        Quien2 = carlos ;
        false.

    f. observa(_,_).
        true.
*/