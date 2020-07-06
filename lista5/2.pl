even(N):- mod(N,2) =:= 0.

board(L) :-
    length(L, N),
    ( even(N) -> First is 0 ; First is 1 ),
    N2 is N - First,
    N3 is N2 / 2,
    create_list_white(N3, [], List1, N),
    create_list_black(N3, [], List2, N),
    main_list(List1, List2, N, L, [], FinalList),
    draw(FinalList, N).

create_list_white(0, L, F, FN) :-
    ( even(FN) -> copy_term(L,F) ; append(L, [0], F) ),
    !.
create_list_white(N, List, FinalList, FN) :-
    N > 0,
    append(List, [0], L),
    append(L, [1], L2),
    N2 is N - 1,
    create_list_white(N2, L2, FinalList, FN).


create_list_black(0, L, F, FN) :-
    ( even(FN) -> copy_term(L,F) ; append(L, [1], F) ),
    !.
create_list_black(N, List, FinalList, FN) :-
    N > 0,
    append(List, [1], L),
    append(L, [0], L2),
    N2 is N - 1,
    create_list_black(N2, L2, FinalList, FN).

insert_at(Element, Position, List, FinalList) :-
    nth0(Position, FinalList, Element, List).

delete_at(Position, List, FinalList) :-
    nth0(Position, List, _, FinalList).

main_list(_, _, 0, _, FinalList, FFL) :- copy_term(FinalList, FFL), !.
main_list(List1, List2, N, L, FinalList, FFL) :-
    N > 0,
    nth0(Index, L, N),
    delete_at(Index, List1, L1),
    delete_at(Index, List2, L2),
    ( even(N) -> ( even(Index) -> insert_at(02, Index, L1, FL) ; insert_at(12, Index, L1, FL)) ; ( even(Index) -> insert_at(12, Index, L2, FL) ; insert_at(02, Index, L2, FL) ) ),
    append(FinalList, [FL], FL2),
    N2 is N - 1,
    main_list(List1, List2, N2, L, FL2, FFL).

draw_line(0) :- nl, !.
draw_line(N) :-
    ActualN is N - 1,
    ( ActualN is 0 -> write('+-----+') ; write('+-----')),
    draw_line(ActualN).

draw_empty_white() :-
    write('|     ').
draw_empty_black() :-
    write('|:::::').
draw_hetman_white() :-
    write('| ### ').
draw_hetman_black() :-
    write('|:###:').
draw_last() :-
    write('|').

draw([], N) :- draw_line(N), !.
draw([X|Y], N) :-
    draw_line(N),
    paint(X),
    paint(X),
    draw(Y, N).

paint([]) :-
    draw_last,
    nl,
    !.
paint([X|Y]) :-
    ( ( X =:= 0, draw_empty_white );
    ( X =:= 1, draw_empty_black );
    ( X =:= 2, draw_hetman_white );
    ( X =:= 12, draw_hetman_black ) ),
    paint(Y).
