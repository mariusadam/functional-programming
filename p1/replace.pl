% Write a predicate that substitutes an element of a list with another list

replace([], _, _, []):-!.
replace([H | T], E, L, [L | R]):-
    H =:= E,
    replace(T, E, L, R).
replace([H | T], E, L, [H | R]):-
    H =\= E,
    replace(T, E, L, R).
