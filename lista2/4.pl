:- op(500, xfy, user:(+)).
:- op(400, xfy, user:(*)).
:- op(500, xfy, user:(-)).
:- op(400, xfy, user:(/)).



uprość(Wyrażenie, Wynik) :- pousuwaj(Wyrażenie, X), npar(X, Wynik2), rozdziel(Wynik2, Y, Z), sumlist(Z, L), append([L],Y , W), npar(W, Z), zasady(Z,Wynik).
uprość(X,X).
uprość(Wyrażenie,Wynik) :- zasady(Wyrażenie, Wynik).

% uprość2(Wyrażenie, Wynik) :- findall(Wynik,uprość(Wyrażenie,Wynik),L),min_list(Wynik,L).

rozdziel(X+Y, W, [X|Z]) :- number(X), rozdziel(Y, W, Z).
rozdziel(X+Y, [X|W], Z) :- atom(X), rozdziel(Y, W, Z).
rozdziel(X+Y, W, [P|Z]) :- tm(X,P),number(P), rozdziel(Y, W, Z).
rozdziel(X+Y, [P|W], Z) :- tm(X,P), rozdziel(Y, W, Z).
rozdziel(X, [], [X]) :- number(X).
rozdziel(X, [X], []) :- atom(X).
rozdziel(X, [], [L]) :- tm(X,L), number(L).
rozdziel(X, [L], []) :- tm(X,L).

npar([X], X).
npar([X|S], X+Y) :- npar(S, Y).

tm(X,Rozw) :- rozdz(X, W, Z), pom(Z, Y), append(W,[Y],Q), tmt(Q, Rozw).

rozdz(X*Y, [X|W], Z):- atom(X), rozdz(Y, W, Z).
rozdz(X*Y, W, [X|Z]) :- number(X), rozdz(Y, W, Z).
rozdz(X, [X], []) :- atom(X).
rozdz(X, [], [X]) :- number(X).

tmt([X], X).
tmt([X|S], X*Y)       :- tmt(S, Y).

pom([X|Z], Q) :- pom(Z, P), Q is X*P.
pom([X], Z) :- Z is X.

pousuwaj(X + Y, [X|tms]) :- pousuwaj(Y, tms).
pousuwaj(X - Y, [X|tms]) :- dodaj(Y, tms).
pousuwaj(X, [X]) :- !.

dodaj(Y+Z,[V|tms]):- not(atom(Y)),V is Y*(-1), number(V), pousuwaj(Z, tms).
dodaj(Y-Z,[V|tms]):- not(atom(Y)),V is Y*(-1), number(V), pousuwaj(Z, tms).
dodaj(Y+Z,[P|tms]):- tmN(Y,P), pousuwaj(Z, tms).
dodaj(Y-Z,[P|tms]):- tmN(Y,P), dodaj(Z, tms).
dodaj(Y,[P]):- tmN(Y,P).

tmN(X,Rozw) :- rozdz(X, W, Z), pom2(Z, Q), append(W,[Q],S), tmt(S, Rozw).
tmN(X,Rozw) :- rozdz(X, W, Z), length(Z, L), L == 0, append(W,[-1],S), tmt(S, Rozw).


pom2([X|Z], Q) :- pom(Z, N), Q is X*N.
pom2([X], Y) :- Y is X*(-1).

zasady(X+Y, R) :- !, zasady(X, W), zasady(Y, Z), reguła(W,+,Z, R).
zasady(X-Y, R) :- !, zasady(X, W), zasady(Y, Z), reguła(W,-,Z, R).
zasady(X/Y, R) :- !, zasady(X, W), zasady(Y, Z), reguła(W,/,Z, R).
zasady(X*Y, R) :- zasady(X, W), zasady(Y, Z), reguła(W,*,Z, R).
zasady(X, X).


reguła(X,/,Y, R) :- number(X), number(Y), !,R is X/Y.
reguła(X,*,Y, R) :- number(X), number(Y), !,R is X*Y.
reguła(X,*,Y, R) :- number(X), number(Y), !,R is X*Y.
reguła(X,*,Y, R) :- number(X), number(Y), !,R is X*Y.
reguła(0,+,X, X) :- !.
reguła(X,+,0, X) :- !.
reguła(X,*,0, 0) :- !.
reguła(0,*,X, 0) :- !.
reguła(X,+ ,-X, 0) :- !.
reguła(X,*,Y/Y,X) :- !.
reguła(X,-,X,0) :- !.
reguła(X,+,Y-X,Y):-!.
reguła(X,+,X,2*X):-!.
reguła(X,/,X,1):-!.
reguła(X,/,1,X):-!.
reguła(0,/,X,0):-!.
reguła((Y*X),/,X,Y):-!.
reguła(X,*, -1, -X):- !.
reguła(-1,*,X, -X):- !.
reguła(X,*,1, X) :- !.
reguła(1,*,X, X) :- !.

reguła(X,_,_ ,X).
