function area = IntegralRectangulo(x,fun)
    xmedio = (x(1:end - 1) + x(2:end))./2;
  h = x(2:end)-x(1:end - 1);
    area = sum(fun(xmedio).*h);
  end

