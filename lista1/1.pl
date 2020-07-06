matka(ania, jacek).
matka(ania, ola).
ojciec(mateusz, jacek).
ojciec(mateusz, ola).
ojciec(zbigniew, mateusz).
rodzic(ania, jacek).
rodzic(mateusz, jacek).
mezczyzna(jacek).
mezczyzna(zbigniew).
kobieta(ola).

jest_matka(X) :-
    matka(X, Y).

jest_ojcem(X) :-
    ojciec(X, Y).

jest_synem(X) :-
    mezczyzna(X),
    rodzic(Y, X).

siostra(X, Y) :-
    kobieta(X),
    ojciec(Z, X),
    ojciec(Z, Y),
    matka(W, X),
    matka(W, Y), X\=Y.

dziadek(X, Y) :-
    ojciec(X, Z),
    ojciec(Z, Y),
    mezczyzna(X).

rodzenstwo(X, Y) :-
    ojciec(Z, X),
    ojciec(Z, Y),
    matka(W, X),
    matka(W, Y), X\=Y.
