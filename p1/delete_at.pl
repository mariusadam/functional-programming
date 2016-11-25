% Write a predicate that deletes the element from position n from a list

delete_at([], _, []):-!.
delete_at([_ | T], 0, T):-!.
delete_at([H | T], P, [H | R]):-
    P2 is P - 1,
    delete_at(T, P2, R).
