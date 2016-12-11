% Write a predicate that inserts a given value after the  1st, 2nd, 8th, .. elemnt of a list

pow_of2(N):-
    M is N - 1,
    R is N /\ M,
    R =:= 0.

insert_progressively([], _, _,[]):-!.
insert_progressively([H | T], V, P, R):-
    P2 is P + 1,
    pow_of2(P2),
    insert_progressively(T, V, P2, R2),
    R = [H, V | R2].
insert_progressively([H | T], V, P, [H | R]):-
    P2 is P + 1,
    not(pow_of2(P2)),
    insert_progressively(T, V, P2, R).
             
insert(L, V, R):-
    insert_progressively(L, V, 0, R).

