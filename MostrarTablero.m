function MostrarTablero(board)
  figure;
  hold on;

  for i = 1:size(board, 1)
    for j = 1:size(board, 2)
      shape = board{i, j};
      if ~isempty(shape)
        switch shape
          case 'circle'
            plot(j, i, 'o', 'MarkerSize', 15);
          case 'square'
            plot(j, i, 's', 'MarkerSize', 15);
          case 'triangle'
            plot(j, i, 'v', 'MarkerSize', 15);
          case 'star'
            plot(j, i, '*', 'MarkerSize', 15);
          case 'diamond'
            plot(j, i, 'd', 'MarkerSize', 15);
          % ... Agregar más casos para otras formas ...
        end
      end
    end
  end

  axis([0.5 size(board, 2)+0.5 0.5 size(board, 1)+0.5]);
  grid on;
  hold off;
end
