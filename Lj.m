function P=Lj(xx,j,x)
  n=length(x);
    P = 1;
    for i = 1:n
        if i ~= j
            P = P .* (xx - x(i)) ./ (x(j) - x(i));
        end
    end
  end
