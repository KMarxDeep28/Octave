function resultado = metodoBiseccion(valorInicial,valorFinal, fun,iteraciones=1000, epsilon=1e-6)
  resultado=[];
  intervalo=linspace(valorInicial,valorFinal,iteraciones+1);
  for i=1:iteraciones
    valorInicial=intervalo(i);
    valorFinal=intervalo(i+1);
    if sign(fun(valorInicial)) != sign(fun(valorFinal))
  while (valorFinal - valorInicial) / 2 > epsilon
    aux = (valorInicial + valorFinal) / 2;
    if fun(aux) == 0
      resultado(end+1) = aux;
      break;
    elseif sign(fun(aux)) == sign(fun(valorInicial))
      valorInicial = aux;
    else
      valorFinal = aux;
    endif
  endwhile
  resultado(end+1) = (valorInicial + valorFinal) / 2;
  endif
endfor
resultado=unique(resultado);
  endfunction
