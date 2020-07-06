program([]) --> [].
program([INSTRUKCJA | PROGRAM]) -->
    instrukcja(INSTRUKCJA),
    ['sep(;)'],
    program(PROGRAM).

instrukcja(assign(ID, WYRAZENIE)) -->
    id(ID),
    ['sep(:=)'],
    wyrazenie(WYRAZENIE).
instrukcja(read(ID)) -->
    ['key(read)'],
    id(ID).
instrukcja(write(WYRAZENIE)) -->
    ['key(write)'],
    wyrazenie(WYRAZENIE).
instrukcja(if(WARUNEK, PROGRAM)) -->
    ['key(if)'], warunek(WARUNEK),
    ['key(then)'],
    program(PROGRAM),
    ['key(fi)'].
instrukcja(if(WARUNEK, PROGRAM1, PROGRAM2)) -->
    ['key(if)'],
    warunek(WARUNEK),
    ['key(then)'],
    program(PROGRAM1),
    ['key(else)'],
    program(PROGRAM2),
    ['key(fi)'].
instrukcja(while(WARUNEK, PROGRAM)) -->
    ['key(while)'],
    warunek(WARUNEK),
    ['key(do)'],
    program(PROGRAM),
    ['key(od)'].

wyrazenie(FRAGMENT + WYRAZENIE) -->
    fragment(FRAGMENT), ['sep(+)'], wyrazenie(WYRAZENIE).
wyrazenie(FRAGMENT - WYRAZENIE) -->
    fragment(FRAGMENT), ['sep(-)'], wyrazenie(WYRAZENIE).
wyrazenie(FRAGMENT) -->
    fragment(FRAGMENT).

argument(id(ID)) -->
    id(ID).
argument(int(NUM)) -->
    int(NUM).
argument((WYRAZENIE)) -->
    ['sep(()'],
    wyrazenie(WYRAZENIE),
    ['sep())'].

fragment(FRAGMENT) -->
    argument(FRAGMENT).
fragment(ARGUMENT * FRAGMENT) -->
    argument(ARGUMENT),
    ['sep(*)'],
    fragment(FRAGMENT).
fragment(ARGUMENT / FRAGMENT) -->
    argument(ARGUMENT),
    ['sep(/)'],
    fragment(FRAGMENT).
fragment(ARGUMENT mod FRAGMENT) -->
    argument(ARGUMENT),
    ['key(mod)'],
    fragment(FRAGMENT).

warunek(SUMA ; WARUNEK) -->
    suma(SUMA),
    ['key(or)'],
    warunek(WARUNEK).
warunek(SUMA) -->
    suma(SUMA).

suma(POROWNANIE) -->
    porownanie(POROWNANIE).
suma(POROWNANIE , SUMA) -->
    porownanie(POROWNANIE),
    ['key(and)'],
    suma(SUMA).

porownanie(WYRAZENIE1 =:= WYRAZENIE2) -->
    wyrazenie(WYRAZENIE1),
    ['sep(=)'],
    wyrazenie(WYRAZENIE2).
porownanie(WYRAZENIE1 =\= WYRAZENIE2) -->
    wyrazenie(WYRAZENIE1),
    ['sep(/=)'],
    wyrazenie(WYRAZENIE2).
porownanie(WYRAZENIE1 < WYRAZENIE2) -->
    wyrazenie(WYRAZENIE1),
    ['sep(<)'],
    wyrazenie(WYRAZENIE2).
porownanie(WYRAZENIE1 > WYRAZENIE2) -->
    wyrazenie(WYRAZENIE1),
    ['sep(>)'],
    wyrazenie(WYRAZENIE2).
porownanie(WYRAZENIE1 >= WYRAZENIE2) -->
    wyrazenie(WYRAZENIE1),
    ['sep(>=)'],
    wyrazenie(WYRAZENIE2).
porownanie(WYRAZENIE1 =< WYRAZENIE2) -->
    wyrazenie(WYRAZENIE1),
    ['sep(=<)'],
    wyrazenie(WYRAZENIE2).
porownanie((WARUNEK)) -->
    ['sep(()'],
    warunek(WARUNEK),
    ['sep())'].

id(ID, [IdToken | Rest], Rest) :-
	atom_concat('id(', IdWithBracket, IdToken),
	atom_concat(ID, ')', IdWithBracket).

int(NUM, [NumToken | Rest], Rest) :-
	atom_concat('int(', NumWithBracket, NumToken),
	atom_concat(AtomNum, ')', NumWithBracket),
	atom_number(AtomNum, NUM).
