/*Practical 1
Write a prolog program to calculate the sum of two numbers.*/
sum(X,Y,R):-
	R is X+Y.

/*Practical 2
Write a Prolog program to implement max(X, Y, M) so that M is the maximum of two numbers X and Y.*/
max(X,Y,M):-
	X>Y,
	M=X.

max(X,Y,M):-
	Y>=X,
	M=Y.

/*Practical 3
Write a program in PROLOG to implement factorial (N, F) where F represents thefactorial of a number N.*/
factorial(0,1).
factorial(N,F) :-
    N > 0,
    N1 is N-1,
    factorial(N1,Result1),
    F is Result1*N.

/*Practical 4
Write a program in PROLOG to implement generate_fib(N,T) where T represents theNth term of the fibonacci series.*/
generate_fib(1,0).
generate_fib(2,1).
generate_fib(N,T):-
	N1 is N-1,
	generate_fib(N1,T1),
	N2 is N-2,
	generate_fib(N2,T2),
	T is T1+T2.

/*Practical 5
Write a Prolog program to implement GCD of two numbers.*/
gcd(0, X, X):- 
	X > 0, !.
gcd(X, Y, R):- 
	X >= Y, X1 is X-Y, gcd(X1,Y,R).
gcd(X, Y, R):- 
	X < Y, X1 is Y-X, gcd(X1,X,R).


/*Practical 6
Write a Prolog program to implement power (Num,Pow, Ans) : where Num is raised to the power Pow to get Ans.*/
power(_,0,1).
power(Num,Pow,Ans) :- Pow1 is Pow - 1,
              pow(Num,Pow1,Ans1), Ans is Ans1*Num.

/*you can also simply use*/
power2(Num,Pow,Ans) :- Ans is Num**Pow.

/*Practical 7
Prolog program to implement multi (N1, N2, R) : where N1 and N2 denotes the numbers to be multiplied and R represents the result.*/
multi(N1 ,N2, R) :-
	R is N1*N2.
