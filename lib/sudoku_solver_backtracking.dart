// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

class SudokuSolver {
  SudokuSolver([this.animationDuration = const Duration(milliseconds: 50)]);

  final Duration animationDuration;

  final StreamController<List<List<int>>> streamController =
      StreamController<List<List<int>>>();

  Future<bool> solve(
    List<List<int>> grid,
    DateTime? startTime, [
    int? row = 0,
    int? col = 0,
  ]) async {
    await Future<void>.delayed(animationDuration);

    streamController.add(clone(grid));

    if (row == null && col == null) {
      return true;
    } else {
      for (int value = 1; value <= grid.length; value++) {
        if (_isValid(grid, row!, col!, value)) {
          grid[row][col] = value;

          if (await getNewPriority(grid, startTime: startTime)) {
            final DateTime endTime = DateTime.now();
            final Duration duration = endTime.difference(startTime!);

            print('App has been running for: ${duration.inSeconds} seconds');
            return true;
          }

          grid[row][col] = 0;
        }
      }

      return false;
    }
  }

  static List<List<int>> clone(List<List<int>> grid) {
    final List<List<int>> copy = <List<int>>[];

    for (int i = 0; i < grid.length; i++) {
      copy.add(grid[i].toList());
    }

    return copy;
  }

  static void printGrid(List<List<int>> grid) {
    for (int i = 0; i < grid.length; i++) {
      final StringBuffer row = StringBuffer();

      for (int j = 0; j < grid.length / 3; j++) {
        row.write('${grid[i][j]} ');
      }

      row.write('| ');

      for (int j = grid.length ~/ 3; j < grid.length / 3 * 2; j++) {
        row.write('${grid[i][j]} ');
      }

      row.write('| ');

      for (int j = grid.length ~/ 3 * 2; j < grid.length; j++) {
        row.write('${grid[i][j]} ');
      }

      if (i % 3 == 0 && i != 0) {
        stdout.writeln('------+-------+------');
      }

      stdout.writeln(row);
    }

    stdout.writeln();
  }

  bool _isValid(List<List<int>> grid, int row, int col, int value) {
    final bool notInRow = grid[row].every((int element) => element != value);
    final bool notInCol = grid.every((List<int> row) => row[col] != value);

    bool notInBox = true;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i + (row - row % 3)][j + (col - col % 3)] == value) {
          notInBox = false;
        }
      }
    }

    return notInRow && notInCol && notInBox;
  }

  Future<bool> getNewPriority(List<List<int>> grid,
      {DateTime? startTime}) async {
    int? priorityX;
    int? priorityY;

    int highestRank = 0;

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (grid[i][j] == 0) {
          final int itemRank = getRank(i, j, grid);
          if (itemRank > highestRank) {
            priorityX = i;
            priorityY = j;
            highestRank = itemRank;
          }
        }
      }
    }

    return solve(grid, startTime, priorityX, priorityY);
  }

  int getRank(
    int i,
    int j,
    List<List<int>> grid,
  ) {
    int numbersInRow = 0;
    int numbersInColumn = 0;
    int numberInSquare = 0;
    for (final int element in grid[i]) {
      if (element != 0) {
        numbersInRow++;
      }
    }
    for (int row = 0; row < 9; row++) {
      if (grid[row][j] != 0) {
        numbersInColumn++;
      }
    }
    numberInSquare = getSquareRank(i, j, grid);
    return numberInSquare + numbersInColumn + numbersInRow;
  }

  int getSquareRank(
    int i,
    int j,
    List<List<int>> grid,
  ) {
    final int cellsToleft = j % 3;
    final int cellsToRight = 2 - cellsToleft;

    final int cellsToUp = i % 3;
    final int cellsToDown = 2 - cellsToUp;

    int squareRank = 0;

    for (int x = j - cellsToleft; x <= j + cellsToRight; x++) {
      for (int y = i - cellsToUp; y <= i + cellsToDown; y++) {
        if (grid[x][y] != 0) {
          squareRank++;
        }
      }
    }
    return squareRank;
  }

  void dispose() => streamController.close();
}
