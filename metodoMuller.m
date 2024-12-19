function resultados=metodoMuller(fun, x0, x1, x2, max_iter=1000, tol=1e-6)
  resultados = [];
  for iter = 1:max_iter
    h1 = x1 - x0;
    h2 = x2 - x1;
    lambda = h2 / h1;
    delta = 1 + lambda;
    C = fun(x2) * delta;
    B = (2 * lambda + 1) * fun(x2) - delta*delta * fun(x1) + lambda*lambda * fun(x0);
    A = lambda * fun(x2) - lambda * delta * fun(x1) + lambda*lambda * fun(x0);
    raizCuadrada = sqrt(B * B - 4 * A * C);
    if abs(B + raizCuadrada) > abs(B - raizCuadrada)
      denominador = B + raizCuadrada;
    else
      denominador = B - raizCuadrada;
    end
    x3 = x2 + (-2 * C * h2/ denominador);

      if abs((x3 - x2)) < tol
      resultados(end + 1) = x3;
    end
    x0 = x1;
    x1 = x2;
    x2 = x3;
  end

  resultados = unique(resultados);

  endfunction
