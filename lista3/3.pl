perm([], []).
perm(L1, [X | L3]) :- select(X, L1, L2), perm(L2, L3).

wszystkiePerm(L, List) :- findall(X,perm(L,X),List).

comb2(_,[]).
comb2([X|T],[X|Comb]):-comb2(T,Comb).
comb2([_|T],[X|Comb]):-comb2(T,[X|Comb]).

listaMozliwychInwersj(L, Wynik) :- findall([X,Y], comb2(L,[X,Y]), Wynik).

sprawdzInwersje([], 0).
sprawdzInwersje([H|T], N) :- sprawdzInwersje(T, N1), ((lista2(H), N is N1+1) ; ( \+ lista2(H), N is N1)).

lista2([X,Y]) :- X > Y.

even_permutation(L, X) :-
    wszystkiePerm(L, WszystkiePermutacje),
    member(X, WszystkiePermutacje),
    listaMozliwychInwersj(X, ListaInwersji),
    sprawdzInwersje(ListaInwersji, Licznik),
    0 is mod(Licznik, 2).

odd_permutation(L, X) :-
    wszystkiePerm(L, WszystkiePermutacje),
    member(X, WszystkiePermutacje),
    listaMozliwychInwersj(X, ListaInwersji),
    sprawdzInwersje(ListaInwersji, Licznik),
    1 is mod(Licznik, 2).
