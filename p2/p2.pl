% 2.
% a.Sort a list with keeping double values in resulted list. E.g.: [4 2 6 2 3 4] --> [2 2 3 4 4 6]
% b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every sublist, keeping the doubles.
% Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] => 
% [1, 2, [1, 4, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1, 1, 1], 7].

%a.

%length(L:list, C:number, R:number)
%flow model(i,i,o)

length([], C, C).
length([_|T], C, R) :-
    NC is C + 1,
    length(T, NC, R).

%merge_sort(L:list, R:list)
%flow model(i,o)

merge_sort([], []).
merge_sort([E], [E]).
merge_sort(L, R) :-
    split(L, Left, Right),
    merge_sort(Left, RL),
    merge_sort(Right, RR),
    my_merge(RL, RR, R).

% split(L:list, LC:list, Left:list, Right:list)
% flow model(i, i, o, o)

split(L, LC, LC, L) :-
    length(L, 0, RL),
    length(LC, 0, RLC),
    Diff is RLC - RL,
    abs(Diff, AUX),
    AUX =< 1.
split([H|T], LC, Left, Right) :-
    append(LC, H, RA),
    split(T, RA, Left, Right).

% split(L:list, Left:list, Right:list)
% flow model(i, o, o)

split(L, Left, Right) :- split(L, [], Left, Right).

% append(L:list, E:number, R:list)
% flow model(i, i, o)

append([], E, [E]).
append([H|T], E, [H|R]) :-
    append(T, E, R).

% my_merge(L:list, R:list, R:list)
% flow model(i, i, o)

my_merge(L, [], L).
my_merge([], R, R).
my_merge([HL|TL], [HR|TR], [HL|R]) :- HL =< HR,
    my_merge(TL, [HR|TR], R).
my_merge([HL|TL], [HR|TR], [HR|R]) :- HL > HR,
    my_merge([HL|TL], TR, R).

% sort_list(L:list, R:list)
% flow model(i, o)

sort_list(L, R) :-
    merge_sort(L, R).

% b

% heterList(L:list, R:list)
% flow model(i, o)

heterList([], []).
heterList([H|T], [HR|R]) :- is_list(H), !,
    sort_list(H, HR),
    heterList(T, R).
heterList([H|T], [H|R]) :-
    heterList(T, R).

