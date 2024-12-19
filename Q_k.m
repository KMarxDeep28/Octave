function Q=Q_k(x,k)
  Q=eye(length(x));
  xk=x(k:end);
  Qk=Q_1(xk);
  Q(k:end,k:end)=Qk;
  end
