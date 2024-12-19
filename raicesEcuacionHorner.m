function [rB,rN,rS]=raicesEcuacionHorner(coeficientes,y,valorInicial,valorFinal)
  fun=@(x) PolyValHorner(coeficientes,x);
  n=length(coeficientes);
  coeficientesDerivados=(n-1:-1:1).*coeficientes(1:end-1);
  derivadafun=@(x) PolyValHorner(coeficientesDerivados,x);
 rB = metodoBiseccion(valorInicial, valorFinal, fun);
  rN = metodoNewton(y, fun, derivadafun, valorInicial);
  rS = metodoSecante(valorInicial, y, fun);
endfunction

