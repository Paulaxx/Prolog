merge(IN1, IN2, OUT) :-
	when((nonvar(IN1), nonvar(IN2)),
		(	(IN1 = [X1 | Y1], IN2 = [X2 | Y2])
		->	(	(X1 < X2)
			->	OUT = [X1 | OUT2], merge(Y1, IN2, OUT2) ;
				OUT = [X2 | OUT2], merge(IN1, Y2, OUT2)
		) ;
			(	IN1 = [X1 | Y1]
			->	OUT = IN1 ;
				(	IN2 = [X2 | Y2]
				->	OUT = IN2 ;
					OUT = []
			)
		)
		)
	).
