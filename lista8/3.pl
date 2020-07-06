:- use_module(library(clpfd)).

numbers_sum([],X,X).
numbers_sum([H|T],Counter,FinalSum) :-
    NewCounter #= H + Counter,
    numbers_sum(T,NewCounter,FinalSum).

how_many_pairs([1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0],Counter,NewCounter) :-
    NewCounter #= Counter + 1.
how_many_pairs([1|_],_,_) :-
    fail.
how_many_pairs([0|L],X,HowMany) :-
    how_many([0|L],X,HowMany).
how_many([0,1],Counter, NewCounter) :-
    NewCounter #= Counter + 1.
how_many([1,1],X,X).
how_many([1,0],X,X).
how_many([0,0],X,X).
how_many([0,1 | T],Counter,HM) :-
    NewCounter #= Counter + 1,
    how_many([1|T],NewCounter,HM).
how_many([1,1 | T],X,HM) :-
    how_many([1|T],X,HM).
how_many([1,0 | T],X,HM) :-
    how_many([0|T],X,HM).
how_many([0,0 | T],X,HM) :-
    how_many([0|T],X,HM).

odcinek(X) :-
    length(X, 16),
    X ins 0..1,
    numbers_sum(X, 0, N),
    N #= 8,
    how_many_pairs(X, 0, N2),
    N2 #= 1.
