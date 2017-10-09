
:- ensure_loaded(library(clpfd)).

/* Make sure diagonals are all the same*/
diagonals_check([_,[_,D,_,_],[_,_,D,_],[_,_,_,D]]).

testcheck([[0,14,10,35],[14,1,1,1],[15,1,1,1],[28,1,1,_]]).

puzzle_solution(Puzzle) :- 
	append(Puzzle, Vs), Vs ins 0..40,
	maplist(all_distinct, Puzzle).



/*
puzzle_solution(Puzzle) :- 
    append(Puzzle, Dom), Dom ins 1..100,
	diagonals_check(Puzzle),
	test_all_lines_outer(Puzzle),	
	transpose(Puzzle, Transposed),
	test_all_lines_outer(Transposed).
*/


/* test_row(Row) :- test_sum(Row), test_multiple(Row).
*/
test_all_lines_outer([_|Rest]) :- test_all_lines(Rest).

test_all_lines([]).
test_all_lines([R1|Rest]) :- test_a_line(R1), test_all_lines(Rest).

test_a_line([A|Res]) :- sumlist(Res, A). 
test_a_line([A|Res]) :- multiplylist(Res, A).



multiplylist(List, Sum) :-
	multiplylist(List, 1, Sum).

multiplylist([], Sum, Sum).
multiplylist([N|Ns], Sum0, Sum) :-
	Sum1 is Sum0 * N,
	multiplylist(Ns, Sum1, Sum).

