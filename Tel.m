function Mk=Tel(x,k)
  n=length(x);
  %Mk=zeros(n,1);
  Mk=eye(n);
  %I=eye(n);
  %ek=I(:,k);
  Mk(k+1:n,k)=-x(k+1:n)/x(k);
  %Mk=eye(n)-Mk*transpose(ek);
  end
