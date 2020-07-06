ile_wystąpień(_, [], 0).
ile_wystąpień(X, [X | T], N) :- ile_wystąpień(X, T, N1), N is N1 + 1.
ile_wystąpień(X2, [X| T], N) :- dif(X2,X), ile_wystąpień(X2, T, N).

jednokrotnie(X,L) :- ile_wystąpień(X,L,1).
dwukrotnie(X,L) :- ile_wystąpień(X,L,2).
