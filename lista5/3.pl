browse(Term) :-
    write(Term),
    nl,
    write('command: '),
    read(Command),
    do(Term, Command, []).

do(Term, 'i', List) :-
    Term =..[_, X|_], !,
    write(X), nl,
    write('command: '),
    read(Command),
    append([Term], List, List2),
    do(X, Command, List2).
do(Term, 'i', List) :-
    write(Term), nl,
    write('command: '),
    read(Command),
    do(Term, Command, List).


do(Term, 'n', []) :-
    write(Term), nl,
    write('command: '),
    read(Command),
    do(Term, Command, []).
do(Term, 'n', [X|Y]) :-
    X =..[_| Z],
    append(_, [Term|[]], Z),
    !,
    write(Term), nl,
    write('command: '),
    read(Command),
    do(Term, Command, [X|Y]).
do(Term, 'n', [X|Y]) :-
    X =..[_| Z],
    append(_, [Term | L], Z),
    L = [N| _],
    write(N), nl,
    write('command: '),
    read(Command),
    do(N, Command, [X|Y]).


do(Term, 'p', [X|Y]) :-
    X =.. [_ | Z],
    Z = [Term|_],
    !,
    write(Term), nl,
    write('command: '),
    read(Command),
    do(Term, Command, [X|Y]).
do(Term, 'p', [X|Y]) :-
    X =..[_|Z],
    append(L, [Term|_], Z),
    append(_, [P], L),
    write(P), nl,
    write('command: '),
    read(Command),
    do(P, Command, [X|Y]).


do(Term, 'o', []) :-
    write(Term), nl.
do(_, 'o', [X|Y]) :-
    write(X), nl,
    write('command: '),
    read(Command),
    do(X, Command, Y).
