function x=Cramer(A,b)
  D=det(A);
  n=size(A,1);
  x=zeros(n,1);
  for jj=1:n
    Mj=A;
    Mj(:,jj)=b;
    Dj=det(Mj);
    x(jj)=Dj/D;
  end
  end
