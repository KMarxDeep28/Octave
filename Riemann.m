function area = Riemann(x, fun) %Se llama simpson
  area = (2*sum(rectangulo(x,fun)) + sum(trapecio(x,fun)))/3;
endfunction

function area = rectangulo(x,fun)
    xmedio = (x(1:end - 1) + x(2:end))/2;
  h = x(2:end)-x(1:end - 1);
    area = sum(fun(xmedio).*h);
  end

  function area = trapecio(x,fun)
    ymedio = (fun(x(1:end - 1)) + fun(x(2:end)))/2;
      h = x(2:end)-x(1:end - 1);
  area = sum(ymedio.*h);
  endfunction

