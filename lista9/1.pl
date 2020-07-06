:- use_module(library(clpfd)).

tasks([
    %D R1 R2
    [2, 1, 3],
    [3, 2, 1],
    [4, 2, 2],
    [3, 3, 2],
    [3, 1, 1],
    [3, 4, 2],
    [5, 2, 1]]).

resources(5, 5).


schedule(H, Ss, MS) :-
    tasks(L),
    resources(R, R2),
    MS in 0..H,
    mt(L, H, T, Ss, MS),
    mt2(L, H, T2, Ss2, MS),
    cumulative(T, [limit(R)]),
    cumulative(T2, [limit(R2)]),
    same(Ss, Ss2),
    once(labeling([min(MS), ff], [MS | Ss])).

mt([], _, [], [], _).
mt([[D, R, _] | L1], H, [task(S, D, E, R, _) | L2], [S | L3], MS) :-
    S in 0..H,
    E #= S + D, MS #>= E,
    mt(L1, H, L2, L3, MS).

mt2([], _, [], [], _).
mt2([[D, _, R] | L1], H, [task(S, D, E, R, _) | L2], [S | L3], MS) :-
    S in 0..H,
    E #= S + D, MS #>= E,
    mt2(L1, H, L2, L3, MS).


same([], []).
same([H1|R1], [H2|R2]):-
    H1 = H2,
    same(R1, R2).
