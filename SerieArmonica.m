
function res = SerieArmonica(N)
    res = 0;
    signo = 1;
    for i = 1:N
        res = res + (signo / i);
        signo = -signo;
    end
end






