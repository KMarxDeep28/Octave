function DA=Det5D(A)
    n = size(A, 1);
    P = perms(1:n);
    DA = 0;
    for i = 1:size(P, 1)
        DA = DA + SignPerm(P(i, :)) * prod(diag(A(:, P(i, :))));
    end
end


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
