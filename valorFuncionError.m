function [rB,rN,rS]=valorFuncionError(y,valorInicial,valorFinal)
  sqrtpi=1.7724538509055160272981674833411451827975494561223871282138077898;
  fun=@(x) funcionErrorIntegral(x) - y;
  derivadafun=@(x) (2/sqrtpi)*exp(-x.*x);
  rB = metodoBiseccion(valorInicial, valorFinal, fun);
  rN = metodoNewton(y, fun, derivadafun, valorInicial);
  rS = metodoSecante(valorInicial, y, fun);
endfunction

