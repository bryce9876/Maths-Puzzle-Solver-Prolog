:- ensure_loaded(library(clpfd)).


puzzle_solution(Puzzle) :- 
	
	strip_row1_col1(Puzzle, Inner),
	append(Inner, InDom), InDom ins 1..9,

	diagonals_check(Inner),

	maplist(all_distinct, Inner),
	transpose(Inner, Trans),
	maplist(all_distinct, Trans),

	get_col_1_res(Puzzle, RowResult), 
    checkRows(Inner, RowResult),

    get_row_1_res(Puzzle, ColResult), 
    checkCols(Inner, ColResult),

    maplist(label, Inner). 




/*-------------- Methods for checking puzzle conditions ----------------*/
/*  So checking correct sum/products in rows/columns, correct diagonals etc.



%% Make sure diagonals are all the same*/
%% Paramater 1: 2D list of grid(not including row/col headers)
diagonals_check(List) :-
    getHead(List, [H|_]),
    diagonals_check_inner(H, List, 0).

diagonals_check_inner(_, [], _).

diagonals_check_inner(Tar, List, Index) :-
	getHead(List, H),
    nth0(Index, H, Tar),
    getTail(List, Tail),
    NewIndex #= Index+1,
    diagonals_check_inner(Tar, Tail, NewIndex).



%% Checks that the rows satisfy sum/product conditions
%% Paramater 1: 2D list of grid(not including row/col headers)
%% Paramater 2: A list of the results from rows
checkRows([], []).

checkRows([H1|T1], [H2|T2]) :-
    test_a_line(H1, H2),
    checkRows(T1, T2).



%% Checks that the cols satisfy sum/product conditions
%% Paramater 1: 2D list of grid(not including row/col headers)
%% Paramater 2: A list of the results from rows
checkCols(Inner, Results) :-
    transpose(Inner, Transposed),
    checkRows(Transposed, Results).



get_row_1_res([H|_], Soln) :- removeFirstElem(H, Soln).

get_col_1_res(Arr, Soln) :- 
	transpose(Arr, Transposed),
    get_row_1_res(Transposed, Soln).



test_a_line(List, Result) :-
	sumlist(List, Sum),
	Sum #= Result.

test_a_line(List, Result) :-
    multiplylist(List, Product),
    Product #= Result.





/*-------------- Methods for list calculations and mannipulation ----------*/



%% Strip the first row and column from a list of lists
strip_row1_col1([_|Res], Soln) :-
    transpose(Res, Transposed),
	removeFirstElem(Transposed , TransposedStripped),
	transpose(TransposedStripped, Soln).



%% Get the head of a list
getHead([H|_], H). 



%% Get the tail of a list
getTail([_|T], T). 



%% Remove the first element form a list
removeFirstElem([_|T] , Soln) :- append(T, [], Soln).



%% Multiply every value in a list
%% Paramater 1: A list of numbers
%% Paramater 2: The result of every value in the list being multiplied 
%%              together
multiplylist(List, Sum) :-
	multiplylistinner(List, 1, Sum).

multiplylistinner([], Sum, Sum).
multiplylistinner([N|Ns], Sum0, Sum) :-
	Sum1 #= Sum0 * N,
	multiplylistinner(Ns, Sum1, Sum).



%% Sum every value in a list
%% Paramater 1: A list of numbers
%% Paramater 2: The total sum of every value in the list
sumlist(List, Sum) :-
	sumlistinner(List, 0, Sum).

sumlistinner([], Sum, Sum).
sumlistinner([N|Ns], Sum0, Sum) :-
	Sum1 #= Sum0 + N,
	sumlistinner(Ns, Sum1, Sum).


