function [Q,Q1,R]=MatrizOrtogonalAnulada(n,k)
  Q=orth(randn(n));
  [Q1,R]=qr(Q);
  for i=1:n
    for j=1:n
      if j<i-k
        Q1(i,j)=0;
      endif
    endfor
  endfor

