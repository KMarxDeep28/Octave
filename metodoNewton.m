function resultado=metodoNewton(y,fun,derivadafun,minimo,iteraciones=1000,epsilon=1e-6)
  resultado=[];
  intervalo=linspace(minimo,floor(y),iteraciones+1);
for i=1: iteraciones
  x=intervalo(i);
  xi=x-fun(x)/derivadafun(x);
  while abs((xi-x)/xi) > epsilon
    x=xi;
    xi=x-fun(x)/derivadafun(x);
  endwhile
    if all(abs(resultado - xi) > epsilon)
      resultado (end + 1)= xi;
    endif
  endfor
  resultado=unique(resultado);
  endfunction
