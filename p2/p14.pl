reverse( [] , [] ) . 
reverse[ [X] , [X] ) .  
reverse( [X|Xs] , R ) :- 
  reverse(Xs,T) ,        
    append( T , [X] , R ).   

dif( [], _, [] ).

dif( [0 | T], Last, Res ):-
	dif(T, 1, Res2),
	Res = [9 | Res2].


dif( [H | T], Last, Res):-
	H2 is H - Last,
	dif(T, 0, Res2),
	Res = [H2 | Res2].

pred(List, R):-
	reverse(List, Reversed),
	dif(Reversed, 1, R2),
	reverse(R2, R).

	
