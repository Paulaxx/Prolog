max_sum(L, S) :-
    max_sum(L, 0, 0, S), !.

max_sum([], _, S, S).
max_sum([H | T], Sum, X, S) :-
    NewSum is max(0, Sum + H),
    ((X < Sum + H, NewX is NewSum) ; (X >= Sum +H, NewX is X)),
    max_sum(T, NewSum, NewX, S).
