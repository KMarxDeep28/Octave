function [L,U,P]=FactorizacionPLU(A)
n=size(A,1);
P=eye(n);
L=eye(n);
U=A;
for k=1:n-1
  [~, indice] = max(abs(U(k:n, k)));
  indice = indice + k - 1;
  if indice ~= k
    p=PermEl(n,k,indice);
    Pk=Perm2MatP(p);
    P=Pk*P;
    U=Pk*U;
    if k > 1
      L([k, indice], 1:k-1) = L([indice, k], 1:k-1);
    end
  endif
  Mk=Tel(U(:,k),k);
  U=Mk*U;
  L=L*inv(Mk);
  for i = k+1:n
    L(i, k) = -Mk(i, k);
  end
endfor
  endfunction
