function [salida,camino] = EstadoCanicas(w)
  flujo=[0,0,0,0];
  camino = flujo;
 for i = 1:length(w)
    if w(i) == 0
      flujo(1) = ~flujo(1);
      flujo(4) = 0;
      if flujo(1) == 0
        flujo(4) = flujo(2);
        flujo(2) = ~flujo(2);
      endif
    else
      flujo(3) = ~flujo(3);
      if flujo(3) == 0
        flujo(4) = 1;
      else
        flujo(4) = flujo(2);
        flujo(2) = ~flujo(2);
      endif
    endif
    camino = [camino; flujo];
  endfor
  salida = flujo(end,end);
end
