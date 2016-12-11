% Write a predicate that turns a list into a set

member_of([H | _], H):-!.
member_of([H | T], E):-
    H =\= E,
    member_of(T, E).

collect_set([], Acc, Acc):-!.
collect_set([H | T], Acc, R):-
    not(member_of(Acc, H)),
    collect_set(T, [H | Acc], R).
collect_set([H | T], Acc, R):-
    member_of(Acc, H),
    collect_set(T, Acc, R).

collect_reverse([], Acc, Acc):-!.
collect_reverse([H | T], Acc, R):-
    collect_reverse(T, [H | Acc], R).

reverse(L, R):-
    collect_reverse(L, [], R).

to_set(L, R):-
    collect_set(L, [], R2),
    reverse(R2, R).
