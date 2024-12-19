function integracion = funcionErrorIntegral(x)
  sqrtpi=1.7724538509055160272981674833411451827975494561223871282138077898;
  fun = @(t) exp(-t.*t);
  intervalo=linspace(0,x,20);
  integracion=IntegralSimpson(intervalo, fun)*2/sqrtpi;
  end
