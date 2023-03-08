%9.
%a. Insert an element on the position in a list.
%b. Define a predicate to determine the greatest common divisor of all numbers from a list.

%insert(L:list, E:number, P:number, R:list)
%flow model (i,i,i,o)

insert(L, E, 0, [E|L]):-!.
insert([H|T], E, P, [H|R]):-
    P1 is P-1,
    insert(T, E, P1, R).

%insert([1,2,3,4,5], 12, 3, R)
%R = [1, 2, 3, 12, 4, 5]

%gcd(A:number,, B:number, R:number)
%flow model(i,i,o)

gcd(0, B, B):-!.
gcd(A, 0, A):-!.
gcd(A, B, R):-A<B,
    B1 is B mod A,
    gcd(A,B1,R), !.
gcd(A, B, R):-A>=B,
   	A1 is A mod B,
    gcd(A1, B,R), !.


%gcd_list(L:list, R:number)
% flow model(i,o)

gcd_list([],0).
gcd_list([H], H).
gcd_list([H|T], R):-
    gcd_list(T,R1),
    gcd(R1,H,R).


