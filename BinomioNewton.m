function polinomio = BinomioNewton(a,b,n)
    polinomio = zeros(1, n+1);
    potencias=zeros(1,n+1);
    for k = 0:n
        coeficiente = 1;
        for i = 1:k
            coeficiente = coeficiente * (n - i + 1) / i;
        end
        polinomio(k+1) = coeficiente * (a^(n-k)) * (b^k);
    end
end
