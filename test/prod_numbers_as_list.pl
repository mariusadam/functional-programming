% Write a predicate that muliplies a number given as a list with a digit, without converting to a number

% Flux model: i, i, o), (i, i, i)
internal_reverse([], Acc, Acc).
internal_reverse([H | T], Acc, R):-
	internal_reverse(T, [H | Acc], R).

% Flux model: i, 0), (i, i)
reverse(List, Reversed):- internal_reverse(List, [], Reversed). 

% Flux model: i, i, i, i, 0), (i, i, i, i, i)
internal_sum([], [], 0, Acc, Acc):-!.

internal_sum([], [], 1, Acc, [1 | Acc]):-!.

internal_sum([H | T], [], Tenth, Acc, Result):-
	HF is H + Tenth,
	Tenth2 is HF div 10,
	Digit is HF mod 10,
	internal_sum([], T, Tenth2, [Digit | Acc], Result).

internal_sum([], [H | T], Tenth, Acc, Result):-
	internal_sum([H | T], [], Tenth, Acc, Result).

internal_sum([H1 | T1], [H2 | T2], Tenth, Acc, Result):-
	HF is H1 + H2 + Tenth,
	Tenth2 is HF div 10,
	Digit is HF mod 10,
	internal_sum(T1, T2, Tenth2, [Digit | Acc], Result).

% Flux model: i, i, o), (i, i, i)
sum(L1, L2, Result):-
	reverse(L1, L1F),
	reverse(L2, L2F),
	internal_sum(L1F, L2F, 0, [],Result).

% Flux model: i, i, o), (i, i, i)
prod(L, 1, L).
prod(L, N, R):-
	N > 1,
	N2 is N - 1,
	prod(L, N2, R2),
	sum(L, R2, R).
