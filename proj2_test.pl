%  Author   : Peter Schachte
%  Origin   : Tue Oct  7 17:49:54 2014
%  Purpose  : Sample test cases for proj2
%  Copyright: © 2014 Peter Schachte.  All rights reserved.
%
%  The test cases I will use for testing are different from these, but
%  generated in the same way, and of similar difficulty.

:- ensure_loaded(prologtest).
:- ensure_loaded(proj2).

test(puzzle_solution([[0,45,72],[72,_,_],[14,_,_]]),[puzzle_solution([[0,45,72],[72,9,8],[14,5,9]])],20,1).
test(puzzle_solution([[0,11,36],[13,_,_],[18,_,_]]),[puzzle_solution([[0,11,36],[13,9,4],[18,2,9]])],20,1).
test(puzzle_solution([[0,13,8],[6,_,_],[13,_,_]]),[puzzle_solution([[0,13,8],[6,4,2],[13,9,4]])],20,1).
test(puzzle_solution([[0,16,13],[42,_,_],[16,_,_]]),[puzzle_solution([[0,16,13],[42,7,6],[16,9,7]])],20,1).
test(puzzle_solution([[0,15,32],[32,_,_],[56,_,_]]),[puzzle_solution([[0,15,32],[32,8,4],[56,7,8]])],20,1).
test(puzzle_solution([[0,14,27],[27,_,_],[45,_,_]]),[puzzle_solution([[0,14,27],[27,9,3],[45,5,9]])],20,1).
test(puzzle_solution([[0,11,54,45],[16,_,_,9],[35,_,_,_],[27,_,_,_]]),[puzzle_solution([[0,11,54,45],[16,1,6,9],[35,7,1,5],[27,3,9,1]])],20,1).
test(puzzle_solution([[0,252,35,168],[11,_,_,_],[19,_,_,_],[21,_,_,_]]),[puzzle_solution([[0,252,35,168],[11,7,1,3],[19,4,7,8],[21,9,5,7]])],20,1).
test(puzzle_solution([[0,14,18,48],[20,_,_,_],[9,_,_,_],[126,_,_,_]]),[puzzle_solution([[0,14,18,48],[20,3,9,8],[9,4,3,2],[126,7,6,3]])],20,1).
test(puzzle_solution([[0,72,336,23],[22,_,_,_],[17,_,_,_],[18,_,_,_]]),[puzzle_solution([[0,72,336,23],[22,6,7,9],[17,3,6,8],[18,4,8,6]])],20,1).
test(puzzle_solution([[0,14,140,40],[56,_,_,_],[140,_,_,_],[60,_,_,_]]),[puzzle_solution([[0,14,140,40],[56,4,7,2],[140,7,4,5],[60,3,5,4]])],20,1).
test(puzzle_solution([[0,14,16,18],[189,_,_,_],[17,_,_,_],[60,_,_,_]]),[puzzle_solution([[0,14,16,18],[189,3,9,7],[17,6,3,8],[60,5,4,3]])],20,1).
test(puzzle_solution([[0,42,16,9],[48,_,_,_],[24,_,_,_],[105,_,_,_]]),[puzzle_solution([[0,42,16,9],[48,3,8,2],[24,2,3,4],[105,7,5,3]])],20,1).
test(puzzle_solution([[0,14,189,20],[14,_,_,_],[18,_,_,_],[63,_,_,_]]),[puzzle_solution([[0,14,189,20],[14,7,3,4],[18,2,7,9],[63,1,9,7]])],20,1).
test(puzzle_solution([[0,11,9,162],[14,_,_,_],[18,_,_,_],[84,_,_,_]]),[puzzle_solution([[0,11,9,162],[14,3,2,9],[18,1,3,6],[84,7,4,3]])],20,1).
test(puzzle_solution([[0,224,210,20,18],[210,_,_,_,_],[28,_,_,9,_],[105,_,_,_,_],[56,_,_,_,_]]),[puzzle_solution([[0,224,210,20,18],[210,7,5,3,2],[28,8,7,9,4],[105,1,3,7,5],[56,4,2,1,7]])],20,1).
test(puzzle_solution([[0,120,23,20,192],[324,_,_,_,2],[192,_,_,_,_],[420,_,_,_,_],[216,_,_,_,_]]),[puzzle_solution([[0,120,23,20,192],[324,3,9,6,2],[192,4,3,2,8],[420,5,7,3,4],[216,2,4,9,3]])],20,1).
test(puzzle_solution([[0,120,1080,12,84],[180,_,_,5,_],[13,_,_,_,_],[336,_,_,_,_],[120,_,_,_,_]]),[puzzle_solution([[0,120,1080,12,84],[180,4,9,5,1],[13,5,4,1,3],[336,2,6,4,7],[120,3,5,2,4]])],20,1).
test(puzzle_solution([[0,1680,36,27,60],[17,_,_,_,_],[28,_,_,9,_],[180,_,_,_,_],[168,_,_,_,_]]),[puzzle_solution([[0,1680,36,27,60],[17,6,2,8,1],[28,8,6,9,5],[180,5,3,6,2],[168,7,1,4,6]])],20,1).
test(puzzle_solution([[0,23,23,40,22],[840,_,_,_,_],[315,_,_,1,_],[120,_,_,_,_],[560,_,_,_,_]]),[puzzle_solution([[0,23,23,40,22],[840,5,7,4,6],[315,9,5,1,7],[120,2,3,5,4],[560,7,8,2,5]])],20,1).
test(puzzle_solution([[0,19,960,20,168],[384,_,_,_,2],[25,_,_,_,_],[60,_,_,_,_],[480,_,_,_,_]]),[puzzle_solution([[0,19,960,20,168],[384,4,6,8,2],[25,9,4,5,7],[60,1,5,4,3],[480,5,8,3,4]])],20,1).
