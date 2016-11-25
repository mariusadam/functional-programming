% Write a predicate that computes the least common multiple of the elements of a list containing positive integers

gcd(A, 0, A):-!.
gcd(A, B, R):-
    B =\= 0,
    Rest is A mod B,
    gcd(B, Rest, R).

lcm(A, B, R):-
    Prod is A * B,
    gcd(A, B, G),
    R is Prod div G. 

lcm_list([], 1):-!.
lcm_list([H], H):-!.
lcm_list([H1, H2 | T], R):-
    lcm(H1, H2, L1),
    lcm_list(T, R1),
    lcm(R1, L1, R).
