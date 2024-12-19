function W=matrizVandermonde(x)
    n = length(x);
    W = zeros(n,n);
    aux=ones(n,1);
    for i = 1:n
        W(:,i) = aux;
        aux=x(:).*aux;
    end
  end
