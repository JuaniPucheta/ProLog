/*
    Dada la siguiente estructura de hechos: 
        horoscopo(Signo,DiaInicio,MesIni,DiaFin,MesFin).
    Por ejemplo: 
        horoscopo(aries,21,3,20,4). 
        horoscopo(tauro,21,4,21,5). 
        horoscopo(geminis,22,5,21,6).
    Definir una regla del estilo signo(Dia, Mes, Signo) que permita:
        a. Ingresar un signo, día y mes y me informe si es correcto ese signo para esa fecha. 
            Ejemplo: 
                ?-signo(3,5,tauro). 
                ?-signo(23,4,aries).
        b. Ingresar una fecha (día y mes) y me informe de qué signo soy. 
            Ejemplo: 
                ?-signo(16,12,Signo). 
                ?-signo(7,4,Signo).
*/

horoscopo(aries,21,3,20,4). 
horoscopo(tauro,21,4,21,5). 
horoscopo(geminis,22,5,21,6).

signo(3,5,tauro). 
signo(23,4,aries).

% a. Ingresar un signo, día y mes y me informe si es correcto ese signo para esa fecha.
signo(Dia, Mes, Signo) :-
    horoscopo(Signo, DiaInicio, MesIni, DiaFin, MesFin),
    Mes =< MesFin,
    Mes >= MesIni,
    ((Mes =:= MesIni, Dia >= DiaInicio) ; (Mes =:= MesFin, Dia =< DiaFin)).


% b. Ingresar una fecha (día y mes) y me informe de qué signo soy.
signo(Dia, Mes, _) :-
    horoscopo(Signo, DiaInicio, MesIni, DiaFin, MesFin),
    Mes =< MesFin,
    Mes >= MesIni,
    ((Mes =:= MesIni, Dia >= DiaInicio) ; (Mes =:= MesFin, Dia =< DiaFin)),
    write(Signo).