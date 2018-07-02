# Maths Puzzle Solver in Prolog
Solve maths puzzle given by the specification below using Prolog and the the clpfd library 

# Puzzle specification 
A maths puzzle is a square grid of squares, each to be filled in with a single digit 1–9 (zero is not permitted) satisfying
these constraints:

- Each row and each column contains no repeated digits
- All squares on the diagonal line from upper left to lower right contain the same value
- The heading of reach row and column (leftmost square in a row and topmost square in a column) holds either the sum or the
product of all the digits in that row or column.

Note that the row and column headings are not considered to be part of the row or column, and so may be filled with a number
larger than a single digit. The upper left corner of the puzzle is not meaningful.

When the puzzle is originally posed, most or all of the squares will be empty, with the headings filled in. The goal of the
puzzle is to fill in all the squares according to the rules. A proper maths puzzle will have at most one solution.

Here is an example puzzle as posed (left) and solved (right):

 ____ ____ ____ ____    ____ ____ ____ ____ 
```
 ____ ____ ____ ____    ____ ____ ____ ____ 
|    | 14 | 10 | 35 |  |    | 14 | 10 | 35 |
| 14 |    |    |    |  | 14 |  7 |  2 |  1 |
| 15 |    |    |    |  | 15 |  3 |  7 |  5 |
| 28 |    |    |    |  | 28 |  1 |  1 |  7 |
 ---- ---- ---- ----    ---- ---- ---- ----  
```

# Input format 
A maths puzzle (Puzzle) will be represented as a lists of lists, each of the same length, representing a single row of the
puzzle. The first element of each list is considered to be the header for that row. Each element but the first list in the
puzzle is considered to be the header of the corresponding column of the puzzle. The first element of the first element of
the list is the corner square of the puzzle, and thus is ignored."

Examples of valid input can be found in proj2_test.pl

# How to run 
1. Install SWI-Prolog
2. Open up proj2_test.pl in SWI-Prolog
3. Then run do_tests.
