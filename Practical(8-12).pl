/*Practical 8
Write a Prolog program to implement memb(X, L): to check whether X is a member of L or not.*/
memb(X,[X|T]).
memb(X,[H|T]):-
	memb(X,T).

/*Practical 9
Write a Prolog program to implement conc (L1, L2, L3) where L2 is the list to be appended with L1 to get the resulted list L3.*/
conc([],L,L).
conc([X|L1],L2,[X|L3]):-
	conc(L1,L2,L3).

/*Practical 10
Write a Prolog program to implement reverse (L, R) where List L is original and List R is reversed list.*/
reverse([],[]).
reverse([X|L1],L2):-
	reverse(L1,L3),
	conc(L3,[X],L2).

/*Practical 11
Write a program in PROLOG to implement palindrome (L) which checks whether a list L is a palindrome or not.*/
palindrome(L):-
	reverse(L,L).

/*Practical 12
Write a Prolog program to implement sumlist(L, S) so that S is the sum of a given list L.*/
sumlist([],0).
sumlist([X|L1],S):-
	sumlist(L1,S1),
	S is S1+X.
	

