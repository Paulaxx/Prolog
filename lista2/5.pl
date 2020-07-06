ile_wystąpień(_, [], 0).
ile_wystąpień(X, [X | T], N) :- ile_wystąpień(X, T, N1), N is N1 + 1.
ile_wystąpień(X2, [X| T], N) :- dif(X2,X), ile_wystąpień(X2, T, N).

roz([],_).
roz([X|Y], L) :-  ile_wystąpień(X, L, 2), roz(Y,L).


warunek1(M,Z) :-
    findall(X,nth0(X,Z,M),L),
    member(A,L), member(B,L), dif(A,B), C is abs(A-B), D is C mod 2, D =:= 1, !.

parzystaOdleglosc([],_).
parzystaOdleglosc([X|Y],L) :- warunek1(X,L), parzystaOdleglosc(Y,L).



dobryElement(X, N) :- between(1,N,X).

calaLista([],_).
calaLista([X|Y], N) :- dobryElement(X,N), calaLista(Y,N).


silnia(0,1).
silnia(N,F) :-
   N>0,
   N1 is N-1,
   silnia(N1,F1),
   F is N * F1.

listaPom(N,X) :-
    length(X,M),
    M is N*2,
    roz(X,X),
    parzystaOdleglosc(X, X),
    calaLista(X, N),
    lista3(X,X).


sprawdzPozycje([],_,_).
sprawdzPozycje([X|Y],L,A) :- nth0(P,L,X), nth0(K,L,X), dif(P,K),((P < K, D is P) ; (K < P, D is K)), D < A, sprawdzPozycje(Y,L,A).

pozycja(D,L,X) :- nth0(W,L,X) , nth0(Q,L,X), dif(W,Q), ((W < Q, D is W) ; (Q < W, D is Q)), !.

lista2(A,M,L) :- (M-1 =:= 0, !) ; (D is M-1, numlist(1, D, Z), sprawdzPozycje(Z,L,A), !).

lista3([],_).
lista3([X|Y],L) :-  pozycja(D,L,X), lista2(D,X,L), lista3(Y,L).


lista(N,X) :-
    silnia(N, S),
    limit(S, listaPom(N,X)).
