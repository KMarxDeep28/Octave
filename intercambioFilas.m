function x=intercambioFilas(A,filaIni,filaFin)
  v=A(filaIni,:);
  A(filaIni,:)=A(filaFin,:);
  A(filaFin,:)=v;
  x=A;
  end
