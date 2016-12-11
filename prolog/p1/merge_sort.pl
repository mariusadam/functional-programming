% Merge sort implementation

merge([], RS, RS):-!.
merge(LS, [], LS):-!.
merge([L | LT], [R | RS], [L | M]):-
    L < R,
    merge(LT, [R | RS], M).
merge([L | LT], [R | RT], [R | M]):-
    R < L,
    merge([L | LT], RT, M).
merge([L | LT], [R | RT], [R | M]):-
    R =:= L,
    merge(LT, RT, M).


split([], [], []):-!.
split([H], [H], []):-!.
split([L,R | T], [L | LS], [R | RS]):-
    split(T, LS, RS).

merge_sort([], []):-!.
merge_sort([H], [H]):-!.
merge_sort(L, S):-
    split(L, LS, RS),
    merge_sort(LS, SL),
    merge_sort(RS, SR),
    merge(SL, SR, S).
