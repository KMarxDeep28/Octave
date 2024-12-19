function yy=PolyValA(coeficientes,xx)
  n = length(coeficientes) - 1;
  yy = zeros(size(xx));
  for i = n:-1:1
    xw = coeficientes(n - i + 1) .* xx.^i;
    yy = yy + xw;
  end
  yy = yy + coeficientes(n + 1);
end
