function Q_1 = Ort(x)
  I=eye(length(x));
  u=x+sign(x(1))*norm(x)*I(:,1);
  Q_1=I-2*(u*u')/(u'*u);
end
