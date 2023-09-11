import '../lib/sudoku_solver_backtracking.dart';

void main(List<String> arguments) {
  final DateTime startTime = DateTime.now();

  (SudokuSolver()..getNewPriority(grid, startTime: startTime))
      .streamController
      .stream
      .listen((dynamic grid) => SudokuSolver.printGrid(grid));
}

/// Hard Puzzle Example
final List<List<int>> grid = <List<int>>[
  <int>[4, 9, 0, 8, 2, 0, 0, 0, 6],
  <int>[0, 0, 0, 0, 0, 0, 0, 0, 0],
  <int>[0, 0, 5, 0, 1, 0, 2, 0, 3],
  <int>[8, 0, 0, 0, 0, 3, 0, 1, 0],
  <int>[0, 0, 7, 0, 0, 0, 5, 0, 0],
  <int>[0, 1, 0, 6, 0, 0, 0, 0, 8],
  <int>[2, 0, 8, 0, 3, 0, 7, 0, 0],
  <int>[0, 0, 0, 0, 0, 0, 0, 0, 0],
  <int>[5, 0, 0, 0, 7, 1, 0, 6, 4],
];
