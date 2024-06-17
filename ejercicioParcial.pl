par(X) :- 0 is X mod 2.
sumar([],0).
sumar([X|T], R) :- par(X), sumar(T,R1), R is R1 + X.
sumar([X|T], R) :- \+par(X), sumar(T,R).

sumarL([],[]).
sumarL([T|U], [[R]|L]) :- sumar(T,R), sumarL(U,L).