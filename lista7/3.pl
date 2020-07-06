filozofowie :-
    mutex_create(Fork1),
    mutex_create(Fork2),
    mutex_create(Fork3),
    mutex_create(Fork4),
    mutex_create(Fork5),
    thread_create(filozof(1, Fork1, Fork2), _, [detached(true)]),
    thread_create(filozof(2, Fork2, Fork3), _, [detached(true)]),
    thread_create(filozof(3, Fork3, Fork4), _, [detached(true)]),
    thread_create(filozof(4, Fork4, Fork5), _, [detached(true)]),
    thread_create(filozof(5, Fork5, Fork1), _, [detached(true)]).

filozof(Id, RightFork, LeftFork) :-
    write_spaces(Id), write('['), write(Id), write(']'), write(" mysli"), nl,
    write_spaces(Id), write('['), write(Id), write(']'), write(" chce prawy widelec"), nl,
    mutex_lock(RightFork),
    write_spaces(Id), write('['), write(Id), write(']'), write(" podniosl prawy widelec"), nl,
    write_spaces(Id), write('['), write(Id), write(']'), write(" chce lewy widelec"), nl,
    mutex_lock(LeftFork),
    write_spaces(Id), write('['), write(Id), write(']'), write(" podniosl lewy widelec"), nl,
    write_spaces(Id), write('['), write(Id), write(']'), write(" je"), nl,
    mutex_unlock(RightFork),
    write_spaces(Id), write('['), write(Id), write(']'), write(" odklada prawy widelec"), nl,
    mutex_unlock(LeftFork),
    write_spaces(Id), write('['), write(Id), write(']'), write( " odklada lewy widelec"), nl,
    filozof(Id, RightFork, LeftFork).

write_spaces(X) :-
    write_sp(X, 0).

write_sp(Counter, Counter) :- !.
write_sp(Counter, ActualCounter) :-
    NewCounter is ActualCounter + 1,
    write(" "),
    write_sp(Counter, NewCounter).
