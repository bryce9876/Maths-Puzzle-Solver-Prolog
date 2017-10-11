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


%% test(puzzle_solution([[0,11,9,162],[14,_,_,_],[18,_,_,_],[84,_,_,_]]),[puzzle_solution([[0,11,9,162],[14,3,2,9],[18,1,3,6],[84,7,4,3]])],20,1).


%% Make sure diagonals are all the same*/
%% Paramater 1: 2D list of grid(not including row/col headers), length=3
diagonals_check([[D,_,_],[_,D,_],[_,_,D]]).



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



%% Multiply every value in a list
multiplylist(List, Sum) :-
	multiplylistinner(List, 1, Sum).

%% TODO: throw error if a value isnt a num
multiplylistinner([], Sum, Sum).
multiplylistinner([N|Ns], Sum0, Sum) :-
	Sum1 #= Sum0 * N,
	multiplylistinner(Ns, Sum1, Sum).




%% TODO: Can probably refacor this
%% Multiply every value in a list
sumlist(List, Sum) :-
	sumlistinner(List, 0, Sum).

%% TODO: throw error if a value isnt a num
sumlistinner([], Sum, Sum).
sumlistinner([N|Ns], Sum0, Sum) :-
	Sum1 #= Sum0 + N,
	sumlistinner(Ns, Sum1, Sum).


/*-------------- Methods for stripping elements from the list -------*/

%% Strip the first row and column from a list of lists
strip_row1_col1([_|Res], Soln) :-
    transpose(Res, Transposed),
	removeFirstElem(Transposed , TransposedStripped),
	transpose(TransposedStripped, Soln).



%% Remove the first element form a list
removeFirstElem([_|T] , Soln) :- append(T, [], Soln).
	

