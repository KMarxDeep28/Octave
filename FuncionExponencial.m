

function res = FuncionExponencial(N,x)
  res=1;
  aux=1;
  a=x;
  if x<0
    x=x*-1;
  endif
  for i=1:N
    aux=aux*x/i;
    res=res+aux;
  endfor
  if a<0
    res=1/res;
  endif
end




