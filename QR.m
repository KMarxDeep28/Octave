function [Q,R]=QR(A)
  Q=eye(size(A));
  for i=1:columns(A)
    x=A(1:end,i);
    Qk=Q_k(x,i);
    A=Qk*A;
    Q=Q*Qk;
  endfor
  R=A;
end
