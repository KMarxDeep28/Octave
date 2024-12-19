function resultados=raicesCuadraticasDirecto(a,b,c)
  x_1 = (-b + sqrt(b*b - 4*a*c))/(2*a);
  x_2 = (-b - sqrt(b*b - 4*a*c))/(2*a);
  resultados = [x_1,x_2];
endfunction
