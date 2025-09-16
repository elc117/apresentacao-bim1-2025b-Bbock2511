% mulheres
mulher(summer).
mulher(beth).
mulher(diane).
mulher(joyce).

% homens
homem(morty).
homem(jerry).
homem(rick).
homem(leonard).

% fatos de parentesco de primeiro grau: progenitor(pai/mae, filho)
progenitor(rick, beth).
progenitor(diane, beth).

progenitor(leonard, jerry).
progenitor(joyce, jerry).

progenitor(jerry, summer).
progenitor(beth, summer).

progenitor(jerry, morty).
progenitor(beth, morty).

% REGRAS
% regra para definir pai, X é pai de Y?
pai(X, Y) :- homem(X) , progenitor(X, Y).

% regra para definir mãe, X é mãe de Y?
mae(X, Y) :- mulher(X) , progenitor(X, Y).

% regra para definir avô, X é avô de Y?
avô(X, Y) :- pai(X, Z) , progenitor(Z, Y).

% regra para definir avó, X é avó de Y?
avó(X, Y) :- mae(X, Z) , progenitor(Z, Y).

% regra para definir irmã(o), X é irmã(o) de Y?
% irmao(X, Y) :- (progenitor(Z, X), progenitor(Z, Y)) , X \= Y.

% Regra auxiliar: Define a filiação completa de uma pessoa.
filho_de(Filho, Pai, Mae) :- pai(Pai, Filho), mae(Mae, Filho).

% Regra de irmãos redefinida:
% X e Y são irmãos SE eles têm o mesmo pai E a mesma mãe, e X é diferente de Y.
irmao(X, Y) :- filho_de(X, P, M), filho_de(Y, P, M), X \= Y.
