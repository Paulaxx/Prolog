allMatches([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]).

smallSquare([1,4,5,8]).
smallSquare([2,5,6,9]).
smallSquare([3,6,7,10]).
smallSquare([8,11,12,15]).
smallSquare([9,12,13,16]).
smallSquare([10,13,14,17]).
smallSquare([15,18,19,22]).
smallSquare([16,19,20,23]).
smallSquare([17,20,21,24]).

averageSquare([1,2,4,6,11,13,15,16]).
averageSquare([2,3,5,7,12,14,16,17]).
averageSquare([8,9,11,13,18,20,22,23]).
averageSquare([9,10,12,14,19,21,23,24]).

bigSquare([1,2,3,4,7,11,14,18,21,22,23,24]).


findSmall(L, Small) :-
	smallSquare(Small),
	subset(Small, L).

findAverage(L, Av) :-
	averageSquare(Av),
	subset(Av, L).


nSmall(N, ActualN, L, Small, Small2) :-
    findSmall(L, S),
    \+ member(S, Small),
    append([S], Small, FinalS),
    Counter is (ActualN + 1),
    nSmall(N, Counter, L, FinalS, Small2),
    !.
nSmall(N, ActualN, L, Small, Small2) :-
    \+ (findSmall(L, X), \+ member(X, Small)),
    Small2 = Small,
    N = ActualN.


nAverage(N, ActualN, L, Av, Av2) :-
    findAverage(L, S),
    \+ member(S, Av),
    append([S], Av, FinalA),
    Counter is (ActualN + 1),
    nAverage(N, Counter, L, FinalA, Av2),
    !.
nAverage(N, ActualN, L, Av, Av2) :-
    \+ (findAverage(L, X), \+ member(X, Av)),
    Av2 = Av,
    N = ActualN.


ap([],L,L).
ap([H|T],L,[H|Z]):- ap(T,L,Z).

join([], L, FinalL) :- FinalL = L.
join([X|Y], L, FinalL) :-
    ap(X, L, L2),
    join(Y, L2, FinalL).

join2Lists(L1, L2, L) :- union(L1, L2, L).

listWithoutDuplikates(List, FinalList) :- sort(List, FinalList).

subset(0, [], []).
subset(Len, [E|Tail], [E|NTail]):-
    PLen is Len - 1,
    (PLen > 0 -> subset(PLen, Tail, NTail) ; NTail=[]).
subset(Len, [_|Tail], NTail):-
   subset(Len, Tail, NTail).


createMatchesList(N, S, A, L) :-
    allMatches(AllM),

    nSmall(_, 0, AllM, [], Small),
    nAverage(_, 0, AllM, [], Average),

    subset(S, Small, SmallS),
    subset(A, Average, AverageA),

    join(SmallS, [], Sm),
    join(AverageA, [], Av),
    join2Lists(Sm, Av, List),

    listWithoutDuplikates(List, L),

    length(L, N),

    nSmall(S, 0, L, [], _),
    nAverage(A, 0, L, [], _),

    bigSquare(Big),
    \+ subset(Big, L),

    draw(AllM, L).

createMatchesList2(N, S, A, L) :-
    allMatches(AllM),

    nSmall(_, 0, AllM, [], Small),
    nAverage(_, 0, AllM, [], Average),

    subset(S, Small, SmallS),
    subset(A, Average, AverageA),

    join(SmallS, [], Sm),
    join(AverageA, [], Av),
    join2Lists(Sm, Av, List2),

    bigSquare(Big),
    join2Lists(List2, Big, List),

    listWithoutDuplikates(List, L),

    length(L, N),

    nSmall(S, 0, L, [], _),
    nAverage(A, 0, L, [], _),

    draw(AllM, L).

draw([],_).
draw([X | Rest], L) :-
    ( (member(X, L), drawMatch(X)) ; (\+ member(X, L), notDraw(X)) ),
    draw(Rest, L).

drawMatch(X) :-
	( member(X,[1,2,8,9,15,16,22,23]), write('+---'));
	( member(X,[3,10,17,24]), write('+---+'), nl);
	( member(X,[4,5,6,11,12,13,18,19,20]), write('|   '));
	( member(X,[7,14,21]), write('|'), nl).

notDraw(X) :-
	( member(X,[1,2,8,9,15,16,22,23]), write('+   '));
	( member(X,[3,10,17,24]), write('+   +'), nl);
	( member(X,[4,5,6,11,12,13,18,19,20]), write('    '));
	( member(X,[7,14,21]), write(' '), nl).

zapalki(N, (srednie(S), male(M))) :-
	allMatches(AllM),
	member(N, AllM),
	N2 is (24 - N),
        createMatchesList(N2, M, S, _).

zapalki(N, (srednie(S))) :-
	allMatches(AllM),
	member(N, AllM),
	N2 is (24 - N),
	createMatchesList(N2, 0, S, _).

zapalki(N, (male(M))) :-
	allMatches(AllM),
	member(N, AllM),
	N2 is (24 - N),
	createMatchesList(N2, M, 0, _).

zapalki(N, (duze(D))) :-
	D = 1,
	N = 12,
	allMatches(AllM),
	bigSquare(B),
	draw(AllM, B).

zapalki(N, (duze(D), srednie(S), male(M))) :-
	allMatches(AllM),
	member(N, AllM),
	(D = 1, N2 is (24 - N), createMatchesList2(N2, M, S, _));
	(D = 0, N2 is (24 - N), createMatchesList(N2, M, S, _)).

zapalki(N, (duze(D), male(M))) :-
	allMatches(AllM),
	member(N, AllM),
	N2 is (24 - N),
	( (D = 1, createMatchesList2(N2, M, 0, _)) ;
	(D = 0, createMatchesList(N2, M, 0, _)) ).

zapalki(N, (duze(D), srednie(S))) :-
	allMatches(AllM),
	member(N, AllM),
	N2 is (24 - N),
	( (D = 1, createMatchesList2(N2, 0, S, _)) ;
	(D = 0, createMatchesList(N2, 0, S, _)) ).



