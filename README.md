# Sudoku Solver in Dart Language

Sudoku Solver is a Dart package that provides a Sudoku puzzle solver using the backtracking algorithm. It allows you to input Sudoku puzzles as 2D grids and find solutions for them.

### Features

- Solve Sudoku puzzles of various difficulty levels.
- Visualize the solving process with a customizable animation delay.
- Easy-to-use API for solving Sudoku puzzles.
- Input Sudoku grids as 2D lists of integers.
- Check the validity of a Sudoku grid.
- Print Sudoku grids to the console.

### Usage

Here's an example of how to use the Sudoku Solver package:

```dart
void main(List<String> arguments) {
  (SudokuSolver()..solve(grid))
      .streamController
      .stream
      .listen((dynamic gtid) => SudokuSolver.printGrid(gtid));
}

final List<List<int>> grid = <List<int>>[
  <int>[0, 0, 4, 0, 5, 0, 0, 0, 0],
  <int>[9, 0, 0, 7, 3, 4, 6, 0, 0],
  <int>[0, 0, 3, 0, 2, 1, 0, 4, 9],
  <int>[0, 3, 5, 0, 9, 0, 4, 8, 0],
  <int>[0, 9, 0, 0, 0, 0, 0, 3, 0],
  <int>[0, 7, 6, 0, 1, 0, 9, 2, 0],
  <int>[3, 1, 0, 9, 7, 0, 2, 0, 0],
  <int>[0, 0, 9, 1, 8, 2, 0, 0, 3],
  <int>[0, 0, 0, 0, 6, 0, 1, 0, 0],
];
```

In this example, we create a Sudoku grid as a 2D list of integers with empty cells represented as `0`. We then use the SudokuSolver class to solve the puzzle and visualize the solving process.

### License

This project is licensed under the MIT License. See the LICENSE file for details.

### Acknowledgments

This package was inspired by the classic Sudoku puzzle and the backtracking algorithm used to solve it.

Happy Sudoku solving with Dart Sudoku Solver!
