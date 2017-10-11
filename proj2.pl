
:- ensure_loaded(library(clpfd)).

/* Make sure diagonals are all the same*/
diagonals_check([[D,_,_],[_,D,_],[_,_,D]]).



puzzle_solution(Puzzle) :- 
	%% Check diagonal
	strip_row1_col1(Puzzle, Inner),
	append(Inner, InDom), InDom ins 1..9,
	diagonals_check(Inner),
	maplist(all_distinct, Inner),

	get_col_1_res(Puzzle, RowResult), 
    checkRows(Inner, RowResult),

    get_row_1_res(Puzzle, ColResult), 
    checkCols(Inner, ColResult),



	transpose(Inner, Trans),
	maplist(all_distinct, Trans).




%% Checks that the rows satisfy sum/product conditions
%% Paramater 1: 2D list of grid(not including row/col headers)
%% Paramater 2: A list of the results from rows
checkRows([], []).

checkRows([H1|T1], [H2|T2]) :-
    test_a_line2(H2, H1),
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



test_a_line2(Result, List) :-
    multiplylist(List, Product),
    Product #= Result.

test_a_line2(Result, List) :-
	sumlist(List, Sum),
	Sum #= Result.


test_a_line3(Result, List) :- sum(List, #=, Result).


	%%get_col_1([_|T]) :-

	/*
	alldistinct
	r1Check
	r2Check
	r3Check.
	*/


/*
r1Check([H|T], [H|_]) :-
test_a_line([H|Res]) :-
    multiplylist(Res, Sum),
    Sum #= A.
*/

%%append(Puzzle, PuzDom), PuzDom ins 0..100,
%%test_all_lines_outer(Puzzle).


/*
puzzle_solution(Puzzle) :- 
    	strip_row1_col1(Puzzle, Inner),
	append(Inner, InDom), InDom ins 1..9,
	diagonals_check(Inner),
*/


/* test_row(Row) :- test_sum(Row), test_multiple(Row).
*/
test_all_lines_outer([_|Rest]) :- test_all_lines(Rest).

test_all_lines([]).
test_all_lines([R1|Rest]) :- test_a_line(R1), test_all_lines(Rest).


%% test_a_line([A|Res]) :- sumlist(Res, A). 
test_a_line([A|Res]) :-
    multiplylist(Res, Sum),
    Sum #= A.


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
	

