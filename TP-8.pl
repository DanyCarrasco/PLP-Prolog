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
%notCasado(X) :- not (, X \= Z).
casado(X) :- casado(X,_).
casado(X) :- casado(_,X).

soltero(X) :- \+ casado(X).  
amante(X,Y) :- casado(X,Y), casado(Z,X), casado(Y,W), X \= Z, X \= Y, X \= W, Y \= W, Z \= Y, Z \= W.
amante(X,Y) :- casado(Y,X), casado(Z,X), casado(W,Y), X \= Z, X \= Y, X \= W, Y \= W, Z \= Y, Z \= W.
suegra(X,Y) :- femenino(X), progenitor(X,Z), casado(Z,Y), X \= Y, X \= Z, Y \= Z.
suegra(X,Y) :- femenino(X), progenitor(X,Z), casado(Y,Z), X \= Y, X \= Z, Y \= Z.
suegro(X,Y) :- masculino(X), progenitor(X,Z), casado(Z,Y), X \= Y, X \= Z, Y \= Z.
suegro(X,Y) :- masculino(X), progenitor(X,Z), casado(Y,Z), X \= Y, X \= Z, Y \= Z.

%Punto 2
%ejemplo de hechos para hacer el ejercicio
on(b,a).
on(c,b).
on(d,c).
on(e,d).
on(f,e).
on(g,f).
on(h,g).

sobre(X,Y) :- on(X,Y), X \= Y.
sobre(X,Y) :- on(X,Z),sobre(Z,Y), X \= Z, Y \= Z.

%punto 3
numeral(0).
numeral(succ(X)):- numeral(X).

suma(0,Y,Y).
suma(succ(X),Y,succ(R)) :- suma(X,Y,R).

resta(X,Y,Z) :- suma(Y,Z,X).
multiplicacion(0,_,0).
multiplicacion(1,Y,Y).
multiplicacion(succ(X),Y,Z) :- suma(succ(X),succ(X),T),
    multiplicacion(X,Y,T).
producto(_,0,0).
producto(X,1,X).
producto(succ(X),Y,Z) :- 
    resta(Z,X,Z1),
        producto(X,Y,Z1).