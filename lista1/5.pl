le2(1,1).
le2(5, 10).
le2(X, Y) :- Y mod X =:= 0.

zwrotna :-
    \+ ( (le(X, _); le(_, X)), \+le(X, X)).
przechodnia :- \+ (le2(A, B), le2(B, C), \+ le2(A,C)).
slabo_antysymetryczna :- \+ (le2(A, B), le2(B, A), A\=B).

czesciowy_porzadek :-
    zwrotna,
    przechodnia,
    slabo_antysymetryczna.


