left_of(olowek, klepsydra).
left_of(klepsydra, motyl).
left_of(motyl, ryba).
left_of(rower, aparat).
above(rower, olowek).
above(aparat, motyl).
above(olowek, kartka).

left_of_rek(X, Y) :-
    left_of(X, Y).

left_of_rek(X, Z) :-
    left_of(X, Y),
    left_of_rek(Y, Z).

right_of(X, Y) :-
    left_of(Y, X).

right_of_rek(X, Y) :-
    left_of(Y, X).
right_of_rek(X, Z) :-
    right_of(X, Y),
    right_of_rek(Y, Z).

below(X, Y) :- above(Y, X).

above_rek(X, Y) :-
    above(X, Y).
above_rek(X, Z) :-
    above(X, Y),
    above_rek(Y, Z).

higher(X, Y) :- (above(X, Z), left_of_rek(Z, Y)); (above(X, Z), right_of_rek(Z, Y)).

