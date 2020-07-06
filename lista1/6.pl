div(A, B, C) :- C is A / B.
divisible(A, B) :- div(A, B, C), integer(C).

composite(X, Y) :-
    Y>1,
    divisible(X, Y).

composite(X, Y) :-
    Y < X / 2,
    composite(X, Y+1).

composite(X) :-
    X > 2,
    composite(X, 2).

is_prime(X) :- not(composite(X)).

prime(X, Y, Z) :-
    X > 1,
    between(X, Y, Z),
    is_prime(Z).
