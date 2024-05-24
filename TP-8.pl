%Progenitor
progenitor(juan, ana).
progenitor(maria, ana).
progenitor(pedro,pablo).
progenitor(maria,pablo).
progenitor(juan,luis).
progenitor(maria,luis).
progenitor(pedro,luciano).
progenitor(laura,luciano).
progenitor(laura,ariel).
progenitor(pedro,ariel).
progenitor(tomas,pedro).
progenitor(jose,juan).
progenitor(daniel,laura).
progenitor(andrea,laura).
progenitor(eugenia,maria).
progenitor(martin,maria).
progenitor(eugenia,rodolfo).
progenitor(martin,rodolfo).
progenitor(eugenia,sandra).
progenitor(martin,sandra).
progenitor(rodolfo,damian).
progenitor(claudia,damian).
progenitor(norma,andrea).
progenitor(carlos,andrea).
progenitor(norma,cecilia).
progenitor(carlos,cecilia).
progenitor(cecilia,gabriel).
progenitor(javier,gabriel).
progenitor(jorge,carlos).
progenitor(silvia,carlos).


% Femenino o Masculino

femenino(ana).
femenino(maria).
femenino(laura).
femenino(eugenia).
femenino(andrea).
femenino(sandra).
femenino(claudia).
femenino(norma).
femenino(cecilia).
femenino(silvia).


masculino(juan).
masculino(pedro).
masculino(pablo).
masculino(luis).
masculino(luciano).
masculino(ariel).
masculino(tomas).
masculino(jose).
masculino(daniel).
masculino(martin).
masculino(rodolfo).
masculino(damian).
masculino(carlos).
masculino(gabriel).
masculino(javier).
masculino(jorge).

%Casados
casado(juan, maria).
casado(pedro, laura).
casado(eugenia, martin).
casado(rodolfo, claudia).
casado(daniel, andrea).
casado(norma,carlos).
casado(cecilia,javier).

%TP 8
%Punto 1

%Inciso a
padre(X, Y) :- masculino(X), progenitor(X,Y).
madre(X, Y) :- femenino(X), progenitor(X, Y).
hermano(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y. 
abuelo(X, Y) :- progenitor(X, Z), progenitor(Z, Y), X \= Y.
bisabuelo(X, Y) :- progenitor(X, Z), abuelo(Z, Y).
tio(X, Y) :- hermano(X, Z), progenitor(Z, Y).
primo(X, Y) :- progenitor(Z, X), tio(Z, Y).
ancestro(X,Y) :- progenitor(X, Y), X \= Y.
ancestro(X,Y) :- progenitor(Z, Y), ancestro(X, Z).

%Inciso c
soltero(X) :- not(casado(X,Z)), X/=Z.
