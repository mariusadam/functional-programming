pivoting(_,[],[],[]):-!.
pivoting(H,[X|T],[X|L],G):-X < H,pivoting(H,T,L,G).
pivoting(H,[X|T],L,[X|G]):-X >= H,pivoting(H,T,L,G).

q_sort([],Acc,Acc).
q_sort([H|T],Acc,Sorted):-
    pivoting(H,T,L1,L2),
    !,
    q_sort(L1,Acc,Sorted1),q_sort(L2,[H|Sorted1],Sorted).

quick_sort(List, Sorted):-q_sort(List, [], Sorted).

sort_sublists([], []):-!.
sort_sublists([H | T], Rez):-
	number(H),
	!,
	sort_sublists(T, T1),
	Rez = [H | T1].

sort_sublists([H | T], Rez):-
	quick_sort(H, H1),
	!,
	sort_sublists(T, T1),
	Rez = [H1, T1].
	