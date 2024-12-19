function [p]=MatP2Perm(P)
  n=size(P,1);
  p=1:n;
  p=mod(find(P),n)';
  idx=(p==0);
  p(idx)=n;
  end
