% Write a predicate that returns the difference of 2 sets

member_of([H | _], H):-!.
member_of([H | T], E):-
    H =\= E,
    member_of(T, E).

sets_diff([], _, []):-!.
sets_diff([H | T], S2, [H | R]):-
    not(member_of(S2, H)),
    sets_diff(T, S2, R).  
sets_diff([H | T], S2, R):-
    member_of(S2, H),
    sets_diff(T, S2, R).
