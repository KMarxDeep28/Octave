function ComprobarSolucion(board)
  correct_board = 1:numel(board);
  correct_board(end) = 0;
  return isequal(board, correct_board);
end
