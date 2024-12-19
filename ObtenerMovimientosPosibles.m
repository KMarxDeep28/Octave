function moves = ObtenerMovimientosPosibles(board)
  [row, col] = find(board == 0);

  moves = [];
  if row > 1
    moves = [moves, board(row-1, col)];
  end
  if row < size(board, 1)
    moves = [moves, board(row+1, col)];
  end
  if col > 1
    moves = [moves, board(row, col-1)];
  end
  if col < size(board, 2)
    moves = [moves, board(row, col+1)];
  end
end
