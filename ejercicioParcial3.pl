doble(X,R) :- R is X*2.
menor(X,Y) :- X < Y.

generar(Y,Y,[[Y,B]]) :- doble(Y,B).
generar(X,Y,[[X,B]|T]) :- menor(X,Y), doble(X,B), X1 is X+1, generar(X1,Y,T).