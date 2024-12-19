function DA=Det3D(A)
    n = size(A, 1);
    P = perms(1:n);
  %e(1)=-1;e(2)=1;e(3)=1;e(4)=-1;e(5)=-1;e(6)=1;
  %A13*A22*A31;
  %A13*A21*A32;
  %A12*A23*A31;
    DA = 0;
    for i = 1:size(P, 1)
        DA = DA + SignPerm(P(i, :)) * prod(diag(A(:, P(i, :))));
    end
end


%El punto . es para que sea continua



function sgn = SignPerm(p)
    n = length(p);
    visited(1:n) = false;
    sgn = 1;

    for k = 1:n
        if ~visited(k)
            next = k;
            L = 0;
            while ~visited(next)
                L = L + 1;
                visited(next) =  true;
                next = p(next);
            end
            if rem(L, 2) == 0
                sgn = -sgn;
            end
        end
    end
end
