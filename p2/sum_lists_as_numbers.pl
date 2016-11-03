%1. 
%   a)Define a predicate wich determines the sum of two numbers represented as a 
%   b)Given an heterogenous list, made up of integers and lists of digits, compute the sum as a list
%     of all the numbers represented as a list.    
%    Example: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] => [8, 2, 2].

internal_reverse([], Acc, Acc).
internal_reverse([H | T], Acc, R):-
	internal_reverse(T, [H | Acc], R).

reverse(List, Reversed):- internal_reverse(List, [], Reversed). 

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

sum(L1, L2, Result):-
	reverse(L1, L1F),
	reverse(L2, L2F),
	internal_sum(L1F, L2F, 0, [],Result).

internal_sublists_sum([], Acc, Acc).

internal_sublists_sum([H | T], Acc, Result):-
	is_list(H),
	sum(H, Acc, Acc2),
	internal_sublists_sum(T, Acc2, Result).

internal_sublists_sum([H | T], Acc, Result):-
	not(is_list(H)),
	internal_sublists_sum(T, Acc, Result).

sublists_sum(L, Result):-
	internal_sublists_sum(L, [], Result).