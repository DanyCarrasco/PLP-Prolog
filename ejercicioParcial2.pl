contar([],0).
contar([X|T], R) :- contar(T,R1), R is R1+1.

menorIg(N,T) :- contar(T,R), N =< R.

elemento(0,T,0).
elemento(K,[X|T],R) :- menorIg(K,[X|T]), K1 is K-1, elemento(K1,T,R1), R is R1 + X.

%elemento(0,L,0).
%elemento(K,[C|B],R):- K>0, KM is K-1, elemento(KM,B,A), R is C+A.