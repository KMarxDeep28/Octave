  function area = IntegralTrapecio(x,fun)
    ymedio = (fun(x(1:end - 1)) + fun(x(2:end)))/2;
      h = x(2:end)-x(1:end - 1);
  area = sum(ymedio.*h);
  endfunction
