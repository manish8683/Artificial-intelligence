%Q1
sum(X, Y, Z) :-
    number(X),
    number(Y),
    !,
    Z is X + Y.
sum(_, _, _) :-
    fail.


%Q2
max(X, Y, M) :-
    number(X),
    number(Y),
    !,
    (X >= Y -> M = X ; M = Y).
max(_, _, _) :-
    fail.


%Q3
factorial(0, 1) :-
    !.
factorial(N, F) :-
    N > 0,
    !,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.
factorial(_, _) :-
    fail.


%Q4
generate_fib(1, 1) :-
    !.
generate_fib(2, 1) :-
    !.
generate_fib(N, T) :-
    N > 2,
    !,
    N1 is N - 1,
    N2 is N - 2,
    generate_fib(N1, T1),
    generate_fib(N2, T2),
    T is T1 + T2.
generate_fib(_, _) :-
    fail.


%Q5
gcd(X, Y, G) :-
    X =< 0, Y =< 0,
    !,
    fail.
gcd(X, 0, X) :-
    !.
gcd(0, Y, Y) :-
    !.
gcd(X, Y, G) :-
    X >= Y,
    !,
    X1 is X - Y,
    gcd(X1, Y, G).
gcd(X, Y, G) :-
    X < Y,
    !,
    Y1 is Y - X,
    gcd(X, Y1, G).


%Q6
power(_, 0, 1) :-
    !.
power(Num, 1, Num) :-
    !.
power(Num, Pow, Ans) :-
    Pow > 0,
    !,
    Pow1 is Pow - 1,
    power(Num, Pow1, Ans1),
    Ans is Ans1 * Num.
power(_, _, _) :-
    fail.


%Q7
multi(_, 0, 0) :-
    !.
multi(0, _, 0) :-
    !.
multi(N1, N2, R) :-
    N1 > 0,
    N2 > 0,
    !,
    N21 is N2 - 1,
    multi(N1, N21, R1),
    R is R1 + N1.
multi(N1, N2, R) :-
    N1 < 0,
    N2 > 0,
    !,
    N11 is -N1,
    multi(N11, N2, R1),
    R is -R1.
multi(N1, N2, R) :-
    N1 > 0,
    N2 < 0,
    !,
    N21 is -N2,
    multi(N1, N21, R1),
    R is -R1.
multi(_, _, _) :-
    fail.


%Q8
memb(X, [X|_]) :-
    !.
memb(X, [_|T]) :-
    memb(X, T),
    !.
memb(_, _) :-
    fail.


%Q9
conc([], L2, L2) :-
    !.
conc([H|T], L2, [H|L3]) :-
    conc(T, L2, L3),
    !.
conc(_, _, _) :-
    fail.


%Q10
reverse([], []) :-
    !.
reverse([H|T], R) :-
    reverse(T, TR),
    conc(TR, [H], R),
    !.
reverse(_, _) :-
    fail.


%Q11
palindrome(L) :-
    reverse(L, L),
    !.
palindrome(_, _) :-
    fail.


%Q12
sumlist([], 0) :-
    !.
sumlist([H|T], S) :-
    sumlist(T, ST),
    S is ST + H,
    !.
sumlist(_, _) :-
    fail.


%Q13
evenlength([]) :-
    !.
evenlength([_|T]) :-
    oddlength(T),
    !.
evenlength(_, _) :-
    fail.

oddlength([_]) :-
    !.
oddlength([_|T]) :-
    evenlength(T),
    !.
oddlength(_, _) :-
    fail.


%Q14
nth_element(1, [H|_], H) :-
    !.
nth_element(N, [_|T], X) :-
    M is N - 1,
    nth_element(M, T, X),
    !.
nth_element(_, [], _) :-
    fail.
nth_element(N, L, _) :-
    length(L, Len),
    N > Len,
    !,
    fail.


%Q15
maxlist([X], X) :- !.
maxlist([H|T], M) :-
    maxlist(T, N),
    (H > N -> M = H ; M = N),
    !.
maxlist([], _) :-
    fail.


%Q16
insert_nth(I, N, L, R) :-
    N > 0,
    N1 is N - 1,
    length(L, Len),
    N =< Len,
    insert_nth_helper(I, N1, L, [], R),
    !.

insert_nth(_, _, L, L) :-
    fail.

insert_nth_helper(I, 0, L, Acc, R) :-
    append(Acc, [I|L], R).

insert_nth_helper(I, N, [H|T], Acc, R) :-
    N > 0,
    N1 is N - 1,
    append(Acc, [H], Acc1),
    insert_nth_helper(I, N1, T, Acc1, R).


%Q17
delete_nth(1, [_|T], T) :- !.
delete_nth(N, [H|T], [H|R]) :- N > 1, N1 is N - 1, delete_nth(N1, T, R).


%Q18
merge([], L2, L2) :- !.
merge(L1, [], L1) :- !.
merge([H1|T1], [H2|T2], [H1|T]) :- H1 =< H2, !, merge(T1, [H2|T2], T).
merge([H1|T1], [H2|T2], [H2|T]) :- merge([H1|T1], T2, T).

