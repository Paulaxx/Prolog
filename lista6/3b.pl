p2 --> {int(N)}, a(N), b(N), c(N).

a(0) --> {!}, [].
a(N) --> {N2 is N - 1}, [a], a(N2).
b(0) --> {!}, [].
b(N) --> {N2 is N - 1}, [b], b(N2).
c(0) --> {!}, [].
c(N) --> {N2 is N - 1}, [c], c(N2).

int(0).
int(N) :-
	int(P),
	N is P + 1.
