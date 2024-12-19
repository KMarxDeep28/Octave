function cierto = certeza(errorRelativo)
  cierto=0;
  aux=1;
  while errorRelativo<5*(1/(10*aux))
    aux=aux*10;
    cierto=cierto+1;
  end
end
