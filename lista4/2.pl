domy([[1, _, _, _, _,_], [2, _, _, _, _,_], [3, _, _, _, _,_], [4, _, _, _, _,_], [5, _, _, _, _,_]]).

rybki(Kto) :-

    domy(Domy),

    member([1, _, norweg, _, _, _], Domy),

    member([_, czerwony, anglik, _, _, _], Domy),

    member([NumerZielonego, _, _, _, _, _], Domy),
    member([NumerBialego, _, _, _, _, _], Domy),
    NumerZielonego is (NumerBialego - 1),

    member([_, _, dunczyk, _, herbata, _], Domy),

    member([NumerLight, _, _, _, _, papierosyLight], Domy),
    member([NumerKoty, _, _, koty, _, _], Domy),
    ( (NumerLight is (NumerKoty - 1)) ; (NumerLight is (NumerKoty + 1))),

    member([_, żółty, _, _, _, cygara], Domy),

    member([_, _, niemiec, _, _, fajki], Domy),

    member([3, _, _, _, mleko, _], Domy),

    member([NumerLight, _, _, _, _, papierosyLight], Domy),
    member([NumerWoda, _, _, _, woda, _], Domy),
    ( (NumerLight is (NumerWoda - 1)) ; (NumerLight is (NumerWoda + 1))),

    member([_, _, _, ptaki, _, bezFiltra], Domy),

    member([_, _, szwed, psy, _, _], Domy),

    member([NumerNorweg, _, norweg, _, _, _], Domy),
    member([NumerNiebieski, niebieski, _, _, _, _], Domy),
    ( (NumerNorweg is (NumerNiebieski - 1)) ; (NumerNorweg is (NumerNiebieski + 1))),


    member([NumerKonie, _, _, konie, _, _], Domy),
    member([NumerŻółty, żółty, _, _, _, _], Domy),
    ( (NumerKonie is (NumerŻółty - 1)) ; (NumerKonie is (NumerŻółty + 1))),

    member([_, _, _, _, piwa, mentolowe], Domy),

    member([_, zielone, _, _, kawa, _], Domy),

    member([_, _, Kto, rybki, _, _], Domy),
    !.
