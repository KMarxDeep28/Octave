function [yy]=Lagrange(xx,x,y)
  n = length(x);
  m = length(xx);
  yy = zeros(m, 1);  % Inicializa el vector de salida

  for i = 1:m
    for j = 1:n
      L = 1;
      for k = 1:n
        if k ~= j
          L = L * (xx(i) - x(k)) / (x(j) - x(k));
        end
      end
      yy(i) = yy(i) + y(j) * L;
    end
  end
end
