le(1, 2).
le(3, 6).
le(6, 2).
le(8, 2).
le(4, 8).
le(3, 2).
le(4, 2).
le(4,4).
le(2, 1).
le(2, 2).

maksymalny(X) :-
    le(X, X);
    (\+ (le(X, Y), Y\=X)).

minimalny(X) :-
    le(X,X);
    (\+ (le(Y, X), Y\=X)).

najwiekszy(X) :- \+ ( le(Z, C), (\+ le(Z, X); \+le(C, X))).
najmniejszy(X) :-  \+ ( le(Z, C), (\+ le(X, Z); \+le(X, C))).


