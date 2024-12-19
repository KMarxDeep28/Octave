function [L,U,P]=MatrizPLU(A)
  n=length(A(1,:));
  P=eye(n,n);
  L=zeros(n,n);
  U=A;
  for i=1:n-1
    [~,indice]=max(abs(U(i:n,i)));
    indice=indice=indice + i - 1;
    U=intercambioFilas(U,i,indice);
    P=intercambioFilas(P,i,indice);
    L=intercambioFilas(L,i,indice);
    L(i+1:n,i) = U(i+1:n,i)/U(i,i);
    U(i+1:n,:)=U(i+1:n,:)-L(i+1:n,i)*U(i,:);
  endfor
  L=L+eye(n,n);
endfunction
