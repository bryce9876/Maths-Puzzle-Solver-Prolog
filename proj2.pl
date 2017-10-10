
:- ensure_loaded(library(clpfd)).

/* Make sure diagonals are all the same*/
diagonals_check([[D,_,_],[_,D,_],[_,_,D]]).



puzzle_solution(Puzzle) :- 
	%% Check diagonal
	strip_row1_col1(Puzzle, Inner),
	append(Inner, InDom), InDom ins 1..9,
	diagonals_check(Inner).


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



%% Strip the first row and column from a list of lists
strip_row1_col1([_|Res], Soln) :-
    transpose(Res, Transposed),
	removeFirstElem(Transposed , TransposedStripped),
	transpose(TransposedStripped, Soln).



%% Remove the first element form a list
removeFirstElem([_|T] , Soln) :- append(T, [], Soln).
	

