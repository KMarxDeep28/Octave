function board = HacerUnMovimiento(board, move)
  [row, col] = find(board == 0);

  [row_move, col_move] = find(board == move);

  board(row, col) = move;
  board(row_move, col_move) = 0;
end
