split(IN, OUT1, OUT2) :-
	split(IN, OUT1, OUT2, 0).

merge_sort(IN, OUT) :-
	freeze(IN,
			(	IN = [H | T]
			->	freeze(T,
						(	\+ (T = [])
						->	split(IN, Part1, Part2),
							merge_sort(Part1, OUT1),
							merge_sort(Part2, OUT2),
							merge(OUT1, OUT2, OUT) ;
							OUT = [H])) ;
				OUT = []
                        )
              ).


split(IN, OUT1, OUT2, C) :-
	freeze(IN,
			(	IN = [X | Y]
			->	(	C = 0
				->	OUT1 = [X | OUT1_],
					C3 is C + 1,
					C2 is C3 mod 2,
					split(Y, OUT1_, OUT2, C2) ;
					OUT2 = [X | OUT2_],
					C3 is C + 1,
					C2 is C3 mod 2,
					split(Y, OUT1, OUT2_, C2)
                                ) ;
				OUT1 = [],
				OUT2 = []
                        )
              ).
