import 'package:flutter/material.dart';

typedef Board = List<List<CellState>>;

class Game {
  CellState nextMove = CellState.x;
  final Board board;

  Game(this.board);

  void updateCellOnTap(int x, int y) {
    if (cellState(x, y) == CellState.outside) {
      return;
    }

    final result = nextMove;
    if (nextMove == CellState.x) {
      nextMove = CellState.o;
    } else if (nextMove == CellState.o) {
      nextMove = CellState.x;
    }

    board[x][y] = result;
  }

  CellState cellState(int x, int y) => board[x][y];
}

enum CellState {
  x(Icons.close),
  o(Icons.circle_outlined),
  empty(null),
  outside(null),
  ;

  const CellState(this.icon);

  final IconData? icon;
}
