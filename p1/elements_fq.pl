% Define a predicate that, computes the frequency of its elements
% Ex: From ([1, 2, 1, 2, 1, 3, 1], X) will result X = [[1, 4], [2, 2], [3, 1]]

remove_occurency([], _, []):-!.
remove_occurency([E | T], E, R):-
    remove_occurency(T, E, R).
remove_occurency([H | T], E, [H | R]):-
    H =\= E,
    remove_occurency(T, E, R).

count_fq([], _, 0):-!.
count_fq([E | T], E, R):-
    count_fq(T, E, R2),
    R is R2 + 1.
count_fq([H | T], E, R):-
    H =\= E,
    count_fq(T, E, R).

elements_fq([], []).
elements_fq([H | T], [[H,F] | R]):-
    count_fq([H | T], H, F),
    remove_occurency(T, H, T2),
    elements_fq(T2, R).
