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
/*multiplicacion(0,_,0).
multiplicacion(1,Y,Y).
multiplicacion(succ(X),Y,Z) :- suma(succ(X),succ(X),T),
    multiplicacion(X,Y,T).
producto(_,0,0).
producto(X,1,X).
producto(succ(X),Y,Z) :- 
    resta(Z,X,Z1),
        producto(X,Y,Z1).*/
producto(succ(0),Y,Y).
producto(succ(X),Y,R) :- producto(X,Y,Z), suma(Z,Y,R).
division(X,Y,R) :- producto(Y,R,X).

potenciacion(X,succ(0),X).
potenciacion(X,succ(Y),R) :- potenciacion(X,Y,Z), producto(Z,X,R).
orden(succ(X),0).
orden(0,0).
orden(succ(X),succ(Y)) :- orden(X,Y).

%Punto 7
%inciso a
concatenacion([],L,L).
concatenacion([H|L1], L2, [H|L3]) :- concatenacion(L1, L2, L3).

%inciso b: pertenencia de un elemento
pertenece(X, [X|T]).
pertenece(X, [H|T]) :- pertenece(X,T).

%inciso c: cantidad de ocurrencia de un elemento
cantOcurrencias(X,[],0).
cantOcurrencias(X,[X|T],Y) :- cantOcurrencias(X,T,Y1), Y is Y1 + 1.
cantOcurrencias(X,[H|T],Y) :- cantOcurrencias(X,T,Y).

%inciso d: eliminacion de la primera ocurrencia de un elemento
eliminar(X,[X|T],T).
eliminar(X,[H|T],L) :- eliminar(X,T,L1), concatenacion([H],L1,L).

%inciso e: sustitucion de la primera ocurrencia de un elemento por otro
sustituir(X,Y,[X|T],[Y|T]).
sustituir(X,Y,[H|T],L) :- sustituir(X,Y,T,L1), concatenacion([H],L1,L).

%inciso f: longitud, ejemplo: entra [1,2,1,3,4] y sale 5
longitud([],0).
longitud([H|T],R) :- longitud(T,R1), R is R1+1.

%inciso g: prefijo
prefijo([],T).
prefijo([X|T],[X|U]) :- prefijo(T,U).
prefijo([X|T],[H|U]) :- prefijo([X|T],U).

%punto 8
%inciso a
izquierda([X|T],L) :- concatenacion(T,[X],L).

%inciso b
derecha(T,L) :- izquierda(L,T).

%inciso c
exterminar(X,[],[]).
exterminar(X,[X|T],L) :- exterminar(X,T,L).
exterminar(X,[H|T],L) :- exterminar(X,T,L1), concatenacion([H],L1,L).

%inciso d
intercambios(X,Y,[],[]).
intercambios(X,Y,[X|T],L) :- intercambios(X,Y,T,L1), concatenacion([Y],L1,L).
intercambios(X,Y,[H|T],L) :- intercambios(X,Y,T,L1), concatenacion([H],L1,L).

%inciso e
cardinalidad([],0).
cardinalidad([X|T],R) :- exterminar(X,T,L), cardinalidad(L,R1), R is R1+1. 

%inciso f
inversion([],[]).
inversion([H|T],L) :- inversion(T,L1), concatenacion(L1,[H],L).

%inciso g
sufijo(T,U) :- inversion(U,L), inversion(T,M), prefijo(M,L).

%inciso h
palindrome(T,L) :- inverso(T,U), comcatenacion(T,U,L).

%inciso i
duplicar([],[]).
duplicar([H|T],L) :- duplicar(T,L1), concatenacion([H],[H],D), concatenacion(D,L1,L).

%Punto 9
%inciso a
inclusion(T,U) :- prefijo(T,U).
inclision(T,U) :- sufijo(T,U).

%inciso b
igualdad(T,U) :- inclusion(T,U), inclusion(U,T).

%inciso c
union([],U,U).
union([X|T],U,L) :- union(T,U,L1), exterminar(X,L1,L2), concatenacion([X],L2,L).

%inciso d
interseccion([],_,[]).
interseccion([X|T],U,L) :- pertenece(X,U), concatenacion([X],L1,L), interseccion(T,U,L1). /*, !.*/
interseccion([X|T],U,L) :- interseccion(T,U,L). /*\+ pertenece(X,U), concatenacion([],L1,L).*/

%inciso e
diferencia([],U,[]).
diferencia([X|T],U,L) :- diferencia(T,U,L1), pertenece(X,U), concatenacion([],L1,L).
diferencia([X|T],U,L) :- diferencia(T,U,L1), \+ pertenece(X,U), concatenacion([X],L1,L).