remove( [], _, [] ) :- !.
remove( [ H | T ], H, T ):- !.
remove( [ H | T ], X, Res ):- 
	remove(T, X, Res2), 
	Res = [ H | Res2 ].

isMember( [ H | _ ], H):- !.
isMember( [ _ | T ], X):- isMember(T, X).

equals( [], [] ).
equals( [ H | T ], List):-
	isMember(List, H),
	remove(List, H, List2),
	equals(T, List2).

atIndex( [], _, null):- !.
atIndex( [ H | _ ], 0, H):- !.
atIndex( [ _ | T ], Offset, Res):-
	NewOffset is Offset - 1,
	atIndex(T, NewOffset, Res).
