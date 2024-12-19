function x = SolPALU(A, b)
    [L, U, P] = MatrizPLU(A);
    Pb = P * b;
    n = length(b);
    y = zeros(n, 1);
    for i = 1:n
        y(i) = Pb(i) - L(i, 1:i-1) * y(1:i-1);
    end
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    end
end
