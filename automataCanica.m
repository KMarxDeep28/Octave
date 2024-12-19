function [lista, salidas] = automataCanica(evaluar = [1,1,1,1])
  CargarDatos();
  Combinaciones(length(evaluar));
  GraficarRecorrido(evaluar);
  GraficarGrafo;

    function CargarDatos()
      figure;
      hold on;
      daspect([1,1]);
      palanca=[];
      Xp = [
      -15,-10,-5,-10;
      15,10,5,10
      ];
      Yp = [
      0,5,0,-5;
      0,5,0,-5
      ];
      for i=1:rows(Xp)
              patch(Xp(i,:), Yp(i,:), 'r', 'FaceAlpha', 0.5);
      endfor
      %bordes
      Xb=[
      -20,-13,-13,-20,-20;%1
      -20,-13,-13,-20,-20;%2
      0,-7,-7,7,7;%3
      0,-7,-7,7,7;%4
      20,13,13,20,20;%5
      20,13,13,20,20%6
      ];
      Yb=[
      0,10,15,15,15;%1
      0,-10,-15,-15,-15;%2
      3,10,15,15,10;%3
      -3,-10,-15,-15,-10;%4
      0,10,15,15,15;%5
      0,-10,-15,-15,-15;%6
      ];
      for i=1:rows(Xb)
              patch(Xb(i,:), Yb(i,:), 'b', 'LineWidth', 2);
      endfor

      X = [
      -13,-10,-7;%1
      -3,0,3;%2
      7,10,13%3
      ];
      Y =[
       8,10,12;%1
      -2,0,2;%2
      8,10,12;%3
      ];
      for i=1:rows(X)
        h = plot(X(i,:),Y(i,:), 'g', 'LineWidth', 3);
        palanca = [palanca;h];
      endfor

      setappdata(0,'Xb',Xb);
      setappdata(0,'Yb',Yb);
      setappdata(0,'palanca',palanca);
endfunction

  function Combinaciones(tamanio)
    w = zeros(1,tamanio);
    [vale2,camino] = EstadoCanicas(w);
      lista = w;
      salidas = w;
    max_val = 2^tamanio;
    for i = 1:max_val-1
        w = dec2bin(i, tamanio) - '0';
        [vale,camino] = EstadoCanicas(w);
        lista = [lista; w];
        if vale ~= 0
          salidas = [salidas;w];
        endif
    end
    if vale2 == 0
      salidas(1,:) = [];
    endif
  end

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

  function GraficarRecorrido(evaluar)
    Yb=getappdata(0,'Yb');
    [salida,camino] = EstadoCanicas(evaluar);
    angulos=[pi/2,pi/2,pi/2];

    for i=1:length(evaluar)
      canica = canicaPosicionInicial(evaluar(i));
      direccion = 'abajo';
      [nuevoX,nuevoY] = canicaRecorrido(canica,'abajo');
      while true

        [interseccion, indicePalanca] = verificarInterseccion(nuevoX, nuevoY);
        if interseccion
          RotarPalanca(indicePalanca, angulos(indicePalanca));
          angulos(indicePalanca) = -angulos(indicePalanca);
          if angulos(indicePalanca) < 0
            direccion = 'izquierda';
          else
            direccion = 'derecha';
          endif
        endif

        if verificarBordes(nuevoX, nuevoY)
          if nuevoX < 0
            direccion = 'derecha';
          else
            direccion = 'izquierda';
          endif
        endif
        [nuevoX,nuevoY] = canicaRecorrido(canica, direccion);
        if nuevoY < min(min(Yb))
          break;
        end

        set(canica,'XData',nuevoX,'YData',nuevoY);
        pause(0.05);
      endwhile
    endfor

    setappdata(0,'camino',camino);
  endfunction

  function GraficarGrafo
    figure;
    hold on;
    camino=getappdata(0,'camino');
    for i=1:rows(camino) - 1
      plot3([camino(i,1),camino(i+1,1)],[camino(i,2),camino(i+1,2)],[camino(i,3),camino(i+1,3)]);
    endfor
  endfunction

    function partida = canicaPosicionInicial(inicio)
      Xb=getappdata(0,'Xb');
      Yb=getappdata(0,'Yb');
        if inicio != 1
          canica = plot(min(min(Xb))/2,max(max(Yb)),'o','MarkerSize',10);
        else
          canica = plot(max(max(Xb))/2,max(max(Yb)),'o','MarkerSize',10);
        endif
        partida = canica;
    endfunction

    function [nuevoX,nuevoY] =canicaRecorrido(canica,direccion)
      exito = false;
      pasoMovimiento = 1 ;
      vertsX = get(canica,'XData');
      vertsY = get(canica,'YData');
      switch direccion
        case 'abajo'
          nuevoX = vertsX;
          nuevoY = vertsY - pasoMovimiento;
        case 'derecha'
          nuevoX = vertsX + pasoMovimiento;
          nuevoY = vertsY - pasoMovimiento;
        case 'izquierda'
          nuevoX = vertsX - pasoMovimiento;
          nuevoY = vertsY - pasoMovimiento;
        otherwise
          return;
      endswitch
    endfunction

  function RotarPalanca(indice, angulo)
    palanca = getappdata(0,'palanca');
    p = palanca(indice);
    Xdata = get(p, 'XData');
    Ydata = get(p, 'YData');
    x_centro = mean(Xdata);
    y_centro = mean(Ydata);
    Xdata_rotado = (Xdata - x_centro) * cos(angulo) - (Ydata - y_centro) * sin(angulo) + x_centro;
    Ydata_rotado = (Xdata - x_centro) * sin(angulo) + (Ydata - y_centro) * cos(angulo) + y_centro;
    set(p, 'XData', Xdata_rotado, 'YData', Ydata_rotado);
  endfunction

    function [interseccion, indicePalanca] = verificarInterseccion(nuevoX,nuevoY)
      palanca = getappdata(0,'palanca');
      interseccion = false;
      indicePalanca = -1;
      for i=1:length(palanca)
          vertXp = get(palanca(i),'XData');
          vertYp = get(palanca(i),'YData');
          if PoligonosSuperpuestos(nuevoX,nuevoY,vertXp,vertYp)
            interseccion = true;
            indicePalanca = i;
            return;
          endif
      endfor
    endfunction

    function resultado = PoligonosSuperpuestos(vertX1, vertY1, vertX2, vertY2)
        resultado = false;
        if any(inpolygon(vertX1, vertY1, vertX2, vertY2)) || any(inpolygon(vertX2, vertY2, vertX1, vertY1))
            resultado = true;
        end
    end

  function colision = verificarBordes(x, y)
    colision = false;
    Xb=getappdata(0,'Xb');
    Yb=getappdata(0,'Yb');
    for i = 1:size(Xb, 1)
      if inpolygon(x, y, Xb(i, :), Yb(i, :))
        colision = true;
        return;
      endif
    endfor
  endfunction
  end
