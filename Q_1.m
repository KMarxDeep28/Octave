function Q = Q_1(x)
  I=eye(length(x));
  u=x+sign(x(1))*norm(x)*I(:,1);
  Q=I-2*(u*u')/(u'*u);
end
