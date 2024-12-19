function resultado=metodoSecante(valorInicial,y,fun, iteraciones=1000,epsilon=1e-6)
  resultado=[];
  intervalo=linspace(valorInicial,floor(y),iteraciones+1);
  for i = 1:iteraciones
    x0 = intervalo(i);
    x1 = y;
    while abs((x1 - x0) / x1) > epsilon
      x2 = x1 - ((x1 - x0) / (fun(x1) - fun(x0))) * fun(x1);
      x0 = x1;
      x1 = x2;
    endwhile
    if all(abs(resultado - x1) > epsilon)
      resultado (end + 1)= x1;
    endif
  endfor
  resultado=unique(resultado);
  endfunction
