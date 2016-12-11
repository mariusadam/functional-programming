internal_reverse([], Acc, Acc).
internal_reverse([H | T], Acc, R):-
	internal_reverse(T, [H | Acc], R).

reverse(List, Reversed):- internal_reverse(List, [], Reversed). 

internal_dif([], [], 0, Acc, Acc).

internal_dif([], [], -1, Acc, [ - | Acc]).

internal_dif([H | T], [], Carry, Acc, Result):-
	H + Carry < 0,
	Digit is 10 + H + Carry,
	internal_dif(T, [], -1, [Digit | Acc], Result).

internal_dif([H | T], [], Carry, Acc, Result):-
	H + Carry >= 0,
	Digit is H + Carry,
	internal_dif(T, [], 0, [Digit | Acc], Result).

internal_dif([], [H | T], _, Acc, Result):-
	internal_dif([H | T], [], -1, Acc, Result).

internal_dif([H1 | T1], [H2 | T2], Carry, Acc, Result):-
	D is H1 + Carry,
	D >= H2,
	Digit is H1 + Carry - H2,
	internal_dif(T1, T2, 0, [Digit | Acc], Result).

internal_dif([H1 | T1], [H2 | T2], Carry, Acc, Result):-
	D is H1 + Carry,
	D < H2,
	Digit is 10 + H1 + Carry - H2,
	internal_dif(T1, T2, -1, [Digit | Acc], Result).
	

eliminate_zero([], []).

eliminate_zero([0 | T], Result):-
	eliminate_zero(T, Result).

eliminate_zero([H | T], Result):-
	H =\= 0,
	Result = [H | T].

dif(L1, L2, Result):-
	reverse(L1, L1F),
	reverse(L2, L2F),
	internal_dif(L1F, L2F, 0, [], R2),
	eliminate_zero(R2, Result).

pred_foreach([], []).

pred_foreach([H | T], Result):-
	number(H),
	pred_foreach(T, R2),
	Result = [H | R2].

pred_foreach([H | T], Result):-
	is_list(H),
	dif(H, [1], H2),
	pred_foreach(T, R2),
	Result = [H2 | R2].