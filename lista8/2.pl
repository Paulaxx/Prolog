:- use_module(library(clpfd)).

plecak(Wartości, Wielkości, Pojemność, Zmienne) :- length(Wartości, N),
	length(Wielkości, N),
	length(Zmienne, N),
        Zmienne ins 0..1,
        scalar_product(Wielkości, Zmienne, #=, SumOfSize),
        scalar_product(Wartości, Zmienne, #=, SumOfValue),
        SumOfSize #=< Pojemność,
        once(labeling([max(SumOfValue)], Zmienne)).

