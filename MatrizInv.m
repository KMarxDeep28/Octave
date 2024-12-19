function inv = MatrizInv(A)
    [filas, columnas] = size(A);
    inv = zeros(filas);
    for i = 1:filas
        for j = 1:columnas
            cofactor = (-1)^(i+j) * det(A([1:i-1, i+1:end], [1:j-1, j+1:end]));
            inv(j, i) = cofactor / det(A);
        end
    end
end

