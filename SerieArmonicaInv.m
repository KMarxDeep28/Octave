 function resinv = SerieArmonicaInv(N)
    resinv = 0;
    signo = -1;
    if mod(N,2)==1
      signo=-signo;
    endif
    for i = N:-1:1
        resinv = resinv + (signo / i);
        signo = -signo;
    end
end
