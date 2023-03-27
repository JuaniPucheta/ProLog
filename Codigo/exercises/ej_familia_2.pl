%? Hechos
padrede(martin,luis).
padrede(luis,jose).
padrede(luis,pedro).
espadre(martin).
espadre(luis).

%? Reglas
hijode(B,A):-padrede(A,B).

%? Reglas_AND
abuelode(A,C):-padrede(A,B),padrede(B,C).
hermanode(B,C):-espadre(A),padrede(A,B),padrede(A,C).

%? Reglas_OR
familiarde(A,B):-padrede(A,B);hijode(A,B);hermanode(A,B);abuelode(A,B)