function area = IntegralSimpson(x, fun)
  area = (2*sum(rectangulo(x,fun)) + sum(trapecio(x,fun)))/3;
endfunction


