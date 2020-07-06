scanner(S, X) :-
	get_char(S, C),
	read2(S, C, X),
	!.

read2(_, end_of_file, []) :-
    !.
read2(S, C1, X) :-
    white(C1),
    !,
    get_char(S, C2),
    read2(S, C2, X).
read2(S, C1, [Token | T]) :-
        char_type(C1, lower),
	read_key(S, C1, C2, '', H),
	!,
	key(H),
        concatenate('key(', H, ')', Token),
	read2(S, C2, T).
read2(S, C1, [Token | T]) :-
	int(C1),
	read_int(S, C1, C2, '', H),
	!,
	int(H),
        concatenate('int(', H, ')', Token),
	read2(S, C2, T).
read2(S, C1, [Token | T]) :-
	id(C1),
	read_id(S, C1, C2, '', H),
	!,
	id(H),
        concatenate('id(', H, ')', Token),
	read2(S, C2, T).
read2(S, C1, [Token | T]) :-
	sep(C1),
	read_sep(S, C1, C2, '', H),
	!,
	sep(H),
        concatenate('sep(', H, ')', Token),
	read2(S, C2, T).


read_key(_, end_of_file, end_of_file, N, N) :-
	!.
read_key(_, C, C, N, N) :-
        \+ char_type(C, lower),
	!.
read_key(S, C1, C3, N1, N) :-
	concatenate(N1, C1, N2),
	get_char(S, C2),
	read_key(S, C2, C3, N2, N).


read_int(_, end_of_file, end_of_file, N, N) :-
	!.
read_int(_, C, C, N, N) :-
	\+ int(C),
	!.
read_int(S, C1, C3, N1, N) :-
	concatenate(N1, C1, N2),
	get_char(S, C2),
	read_int(S, C2, C3, N2, N).
read_int(_, end_of_file, end_of_file, N, N) :-
	!.
read_int(_, C, C, N, N) :-
	\+ int(C),
	!.
read_int(S, C1, C3, N1, N) :-
	concatenate(N1, C1, N2),
	get_char(S, C2),
	read_int(S, C2, C3, N2, N).


read_id(_, end_of_file, end_of_file, N, N) :-
	!.
read_id(_, C, C, N, N) :-
	\+ id(C),
	!.
read_id(S, C1, C3, N1, N) :-
	concatenate(N1, C1, N2),
	get_char(S, C2),
	read_id(S, C2, C3, N2, N).


read_sep(_, end_of_file, end_of_file, N, N) :-
	!.
read_sep(_, C, C, N, N) :-
	\+ sep(C),
	!.
read_sep(S, C1, C3, N1, N) :-
	concatenate(N1, C1, N2),
	get_char(S, C2),
	read_sep(S, C2, C3, N2, N).

white(W) :-
    char_type(W, space),
    !.

key(K) :-
    Keys = ['read', 'write', 'if', 'then', 'else', 'fi', 'while', 'do', 'od', 'and', 'or', 'mod'],
    member(K, Keys),
    !.

sep(S) :-
    Separators = [';', '+', '-', '*', '/', '(', ')', '<', '>', '=<', '>=', ':=', '=', '/=', ':'],
    member(S, Separators),
    !.

int(C) :-
    atom_number(C, _).


id(Word) :-
    string_to_list(Word, L),
    check(L).

check([]).
check([X|Y]):-
    X >= 65,
    X =< 90,
    check(Y).

concatenate(Char1, Center, Char2, Result) :-
    atom_concat(Char1, Center, R1),
    atom_concat(R1, Char2, Result).
concatenate(Char1, Char2, Result) :-
    atom_concat(Char1, Char2, Result).
