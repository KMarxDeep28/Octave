function Mk=TelInv(x,k)
  n=length(x);
  Mk=zeros(n,1);
  I=eye(n);
  ek=I(:,k);
  Mk(k+1:n)=x(k+1:end)/x(k);
  Mk=eye(n)+Mk*transpose(ek);
  end
