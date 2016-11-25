% Write a predicate that remove all duplicate from a list
% Ex.: l=[1,2,1,4,1,3,4] => l=[2,3]
    
count_fq([], _, 0):-!.
count_fq([E | T], E, R):-
    count_fq(T, E, R2),
    R is R2 + 1.
count_fq([H | T], E, R):-
    H =\= E,
    count_fq(T, E, R).

keep_unique(_, [], []):-!.
keep_unique(I, [H | T], [H | R]):-
    count_fq(I, H, 1),
    keep_unique(I, T, R).

keep_unique(I, [H | T], R):-
    not(count_fq(I, H, 1)),
    keep_unique(I, T, R).
