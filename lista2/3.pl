arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

connected(X,X,Visited).
connected(X,Y,Visited) :-
    arc(X,N),
    \+ member(N, Visited),
    connected(N,Y,[N|Visited]).


osiągalny(X,Y) :-  setof(X,connected(X,Y,[]),Xs), member(X,Xs).
