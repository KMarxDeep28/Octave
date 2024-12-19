function resultados=raicesCuadraticasNoDirecto(a,b,c)
  x_1 = (-b+sign(-b) * sqrt(b*b - 4*a*c))/(2*a)
  x_2 = c/(a*x_1);
  resultados = [x_1,x_2];
endfunction
