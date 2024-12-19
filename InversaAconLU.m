function inversa=InversaAconLU(L,U)
    n = size(L);
    U_inv = eye(n);
    L_inv=eye(n);

    for i = n:-1:1
        U_inv(i, :) = U_inv(i, :) / U(i, i);
        for j = i-1:-1:1
            factor = U(j, i);
            U_inv(j, :) = U_inv(j, :) - factor * U_inv(i, :);
        end
    end
        for i = 1:n
        L_inv(i, :) = L_inv(i, :) / L(i, i);
        for j = i+1:n
            factor = L(j, i);
            L_inv(j, :) = L_inv(j, :) - factor * L_inv(i, :);
        end
    end
    inversa=U_inv*L_inv;
end
