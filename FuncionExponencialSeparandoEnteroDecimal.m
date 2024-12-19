function neores=FuncionExponencialSeparandoEnteroDecimal(N,x)
  a=x;
  if x<0
    x=x*-1;
  endif
  ent=fix(x);
  partedecimal=x-ent;
  euler=1;
  for i=1:ent
    euler=2.718281828459045*euler;
  end
    neores=euler * FuncionExponencial(N,partedecimal);
  if a<0
    neores=1/neores;
  endif
end

