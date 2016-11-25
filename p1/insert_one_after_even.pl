% Write a predicate that inserts the number 1 after each even element of an array
even(N):-
  R is N mod 2,
  R =:= 0.

insert_one_after_even([], []).
insert_one_after_even([H | T], [H, 1 | R]):-
  even(H),
  insert_one_after_even(T, R).
insert_one_after_even([H | T], [H | R]):-
  not(even(H)),
  insert_one_after_even(T, R).
