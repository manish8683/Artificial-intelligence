/*Practical 13
Write a Prolog program to implement two predicates evenlength(List) and oddlength(List) so that they are true if their argument is a list of even or odd length respectively.*/
evenlength([]).
evenlength([_|T]):-
	oddlength(T).
oddlength([_|T]):-
	evenlength(T).

/*Practical 14
Write a Prolog program to implement nth_element (N, L, X) where N is the desired position, L is a list and X represents the Nth element of L.*/
nth_element(1, [X|_], X).
nth_element(K,[_|L],X):-
	nth_element(K1,L,X),
	K is K1+1.

/*Practical 15
Write a Prolog program to implement maxlist(L, M) so that M is the maximum number in the list.*/
maxlist([X],X).
maxlist([H|T],M):- 
	maxlist(T,M1), 
	H<M1 -> M is M1;
	M is H.

/*Practical 16
Write a prolog program to implement insert_nth (I, N, L, R) that inserts an item I into Nth position of list L to generate a list R.*/
insert_nth(I, 1, L, [I|L]).
insert_nth(I, N, [H|T], [H|R]):- 
	N1 is N-1,
	insert_nth(I, N1, T, R).

/*Practical 17
Write a Prolog program to implement delete_nth (N, L, R) that removes the element on Nth position from a list L to generate a list R.*/
delete_nth(1, [_|T], T).
delete_nth(N, [H|T], [H|R]):- 
	N1 is N-1,
	delete_nth(N1, T, R).

/*Practical 18
Write a program in PROLOG to implement merge (L1, L2, L3) where L1 is first ordered list and L2 is second ordered list and L3 represents the merged list.*/
merge([],L2,L2).
merge(L1,[],L1).
merge([H1|T1],[H2|T2],[H1|T3]):- 
	H1=<H2,
	merge(T1, [H2|T2], T3).
merge([H1|T1],[H2|T2],[H2|T3]):- 
	merge([H1|T1], T2, T3).




