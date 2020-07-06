on(block1, block2).
on(block2, block3).
on(block3, block4).

above2(X, Y) :-
    on(X, Y).
above2(X, Z) :-
    on(X, Y),
    above2(Y, Z).
