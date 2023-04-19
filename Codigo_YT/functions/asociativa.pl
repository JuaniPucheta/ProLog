%? Declaraciones -----------
amigos(pedro,antonio).
amigos(pedro,juana).
amigos(fernando,pedro).
%? -------------------------

son_amigos(X,Y):-amigos(X,Y).
son_amigos(X,Y):-amigos(Y,X).

%! Comando a ejecutar --> son_amigos(X,Y) 
%   tira los pares 
%   ; para avanzar