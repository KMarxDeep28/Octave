function area = IntegralSimpson(x, fun)
  area = (2*sum(IntegralRectangulo(x,fun)) + sum(IntegralTrapecio(x,fun)))/3;
endfunction


