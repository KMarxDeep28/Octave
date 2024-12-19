function [L,U]=DescomposicionMatriz(A)
   L=eye(size(A));
   for i=1:columns(A)
     x=A(1:end,i);
     M=Tel(x,i);
     Mi=TelInv(x,i);
     A=M*A;
     L=L*Mi;
   endfor
   U=A;
  end
