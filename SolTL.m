function x=SolTL(A,b)
  n=size(A,1);
  x=zeros(n,1);
  for i=1:n
    suma=0;
    for j=1:i-1
      suma=suma+A(i,j)*x(j);
    endfor
    x(i)=(b(i)-suma)/A(i,i);
  end
  end
