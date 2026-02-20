% EJERCICIO 1:
% DIRECTAS: 
padre(abraham,herbert).
padre(abraham, homero).
padre(clancy,marge).
padre(clancy,patty).
padre(clancy, selma).
padre(homero,bart).
padre(homero,lisa).
padre(homero,maggie).

madre(mona,herbert).
madre(mona, homero).
madre(jacqueline, marge).
madre(jacqueline,patty).
madre(jacqueline,selma).
madre(marge,bart).
madre(marge,lisa).
madre(marge,maggie).
madre(selma,ling).
% REGLAS:
acudiente(X,Y):- padre(X,Y).
acudiente(X,Y):-madre(X,Y).
abuelo(X,Y):- acudiente(X,Z), acudiente(Z,Y).
nieto(X,Y):-abuelo(Y,X).
tio(X,Y):- hermano(X,Z), acudiente(Z,Y).
sobrino(X,Y):-tio(Y,X).
hijo(X,Y):- acudiente(Y,X).
hermano(Z,Y):-acudiente(X,Y),acudiente(X,Z), Z\=Y.
primo(X,Y):-acudiente(Z,X), tio(Z,Y).

% Consultas:
% abuel@ paterno: abuelo(abraham,lisa).
% ->true
% abuel@ materno: abuelo(clancy, maggie).
% ->true
% ti@ materno: tio(patty, maggie).
% ->true
% ti@ paterno: tio(herbert,lisa)
% ->true
% tio(herbert,ling)
% ->false

% EJERCICIO 2:
% DIRECTO:
enemigo(corea, eeuu).
enemigo(eeuu,corea).
oriundo(isabella,colombia).
oriundo(coronel,eeuu).
vende(isabella,corea).
vende(coronel,corea).

criminal(X):-oriundo(X,eeuu), vende(X,Y), enemigo(Y,eeuu).

%consultas:
% es criminal el coronel? criminal(coronel).
% -> true.
% es criminal Isabella? criminal(isabella).
% -> false (isabella no es estadounidense)
