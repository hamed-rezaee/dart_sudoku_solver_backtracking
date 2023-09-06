import 'package:dart_sudoku_solver/sudoku_solver_backtracking.dart';

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
