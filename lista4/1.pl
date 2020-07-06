result([X, Y], X+ Y).
result([X, Y], X - Y).
result([X, Y], X * Y).
result([X, Y], X / Y) :-
	dif(Y, 0).

find_expression([X], X).
find_expression(List, Expression) :-
	List = [X, Y | Z],
	result([X, Y], Result),
        append([Result], Z, List2),
        find_expression(List2, Expression).


wyrażenie(Lista, Wartosc, Wyrazenie) :-
	find_expression(Lista, Wyrazenie),
	Wartosc is Wyrazenie,
        !.

