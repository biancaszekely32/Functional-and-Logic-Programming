% 10. For a list a1... an with integer and distinct numbers, 
% define a predicate to determine all subsets with sum of elements divisible with n.

% subsets(L:list, R:list)
% subsets(i, o)

subsets([E], [E]).
subsets([H|T], [H|R]) :-
    subsets(T, R).
subsets([_|T], R) :-
    subsets(T, R).

%allsol(L,R):-
%   findall(RPartial,subsets(L,RPartial),R).


% suma(L:list, C:number, R:number)
% suma(i, i, o)

suma([], C, C).
suma([H|T], C, R) :-
    NC is C + H,
    suma(T, NC, R).


% check(L:list, N:number)- check if divisible with n 
% check(i, i)

check(L, N) :-
    suma(L, 0, RS),
    RS mod N =:= 0.

% onesolution(L:list, N:number, R:list)
% onesolution(i, i, o)

onesolution(L, N, R) :- 
    subsets(L, R),
    check(R, N).

% allsolutions(L:list, N:number, R:list)
% allsolutions(i, i, o)

allsolutions(L, N, R) :-
    findall(RPartial, onesolution(L, N, RPartial), R).