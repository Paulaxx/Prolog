srednia(L,S) :- sumlist(L,Suma), length(L,Dlugosc), S is Suma / Dlugosc.


suma([], _, 0).
suma([H|T], L, TotalSum) :-
    suma(T, L, N1),
    srednia(L, Srednia),
    TotalSum is N1+((H-Srednia)^2).

wariancja(L, D) :- length(L, Dlugosc), suma(L, L, Suma), D is Suma/Dlugosc.
