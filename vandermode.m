function W=vandermode(x)
  n=length(x);
  W=zeros(n,n);
  for j = n:-1:1
    W(:,j)=x(:).^(n-j);
  endfor
end
