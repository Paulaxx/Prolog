środkowy(L, X) :- length(L, Y), mod(Y, 2) =:= 1, Z is div(Y,2), nth0(Z, L, X).
