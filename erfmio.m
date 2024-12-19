function pr=erfmio(x)
sqrtpi=1.7724538509055160272981674833411451827975494561223871282138077898;
xsq= x.*x;  % Coloque el valor correcto.
T= x;  % Coloque el valor correcto.
S= x;   % Coloque el valor correcto.
 en= 0;   % Coloque el valor correcto.
    do
        olds = S;
        en = en + 1;
        T = -xsq .* T * (2 * en - 1) / (en * (2 * en + 1));
        S = S + T;
    until (olds == S)
    pr = 2 / sqrtpi * S;
end



