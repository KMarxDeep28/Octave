function [P]=Perm2MatP(p)
  P=eye(length(p));
  P=P(:,p);
end
