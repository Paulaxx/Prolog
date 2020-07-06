p3 --> {int(N), fib(N, F)}, a(N), b(F).

int(0).
int(N) :-
	int(P),
	N is P + 1.

a(0) --> {!}, [].
a(N) --> {N2 is N - 1}, [a], a(N2).
b(0) --> {!}, [].
b(N) --> {N2 is N - 1}, [b], b(N2).

fib(0, 0) :- !.
fib(1, 1) :- !.
fib(N, F) :-
	N1 is N - 1,
	N2 is N - 2,
	fib(N1, F1),
	fib(N2, F2),
	F is F1 + F2.
