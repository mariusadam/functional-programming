% Write a function which breaks a list of numbers in a list like [list-even-numbers list-odd-numbers]

even(N):-
    R is N mod 2,
    R =:= 0.

odd(N):-
    not(even(N)).

collect_splitted_list([], Acc, Acc):-!.
collect_splitted_list([H | T], Acc, R):-
    even(H),
    collect_splitted_list(T, [H | Acc], R).
collect_splitted_list([H | T], Acc, R):-
    odd(H),
    append(Acc, [H], Acc2),
    collect_splitted_list(T, Acc2, R).

split_list(L, R):-
    collect_splitted_list(L, [], R).
