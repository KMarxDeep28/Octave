function SlidingBlock()
    bloques = [];
    CargarDatos();

    function CargarDatos()
        figure;
        hold on;
        tableroX = [-51 -51 51 51];
        tableroY = [51 -51 -51 51];
        colorTablero = [101/255 67/255 33/255];
        colorBloque = [192/255 192/255 192/255];
        patch(tableroX, tableroY, colorTablero, 'FaceAlpha', 0.3);
        espacioRojoX = [30 30 50 50];
        espacioRojoY = [50 20 20 50];
        patch(espacioRojoX, espacioRojoY, 'r', 'FaceAlpha', 0.5);  % Espacio rojo


        x = [
            -50 -50 0 0; %1
            1 1 20 20; %2
            21 21 50 50; %3
            -20 0 0 -20; %4
            -50 -30 -30 -50; %5
            -50 -50 -20 -20; %6
        ];
        y = [
            50 30 30 50;
            50 10 10 50;
            30 10 10 30;
            29 29 -21 -21;
            -29 -29 1 1;
            -50 -30 -30 -50;
        ];

        colores = [
            192/255 192/255 192/255;  % Gris
            192/255 192/255 192/255;  % Gris
            192/255 192/255 192/255;  % Gris
            192/255 192/255 192/255;  % Gris
            192/255 192/255 192/255;  % Gris
            1 0 0;  % Rojo (Bloque principal)
        ];

        for i = 1:size(x, 1)
            h = patch(x(i, :), y(i, :), colores(i,:), 'FaceAlpha', 0.9);
            bloques = [bloques; h];
            set(h, 'ButtonDownFcn', @(src, event) IniciarAccion(src, event, i));
            centroX = mean(x(i, :));
            centroY = mean(y(i, :));
            %text(centroX, centroY, num2str(i), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 12, 'Color', 'w', 'FontWeight', 'bold');
        end
                daspect([1,1,1]);
    end

    function IniciarAccion(h, ~, indiceBloque)
        disp(['Bloque ' num2str(indiceBloque) ' seleccionado']);
        pt = get(gca, 'CurrentPoint');
        clicX = pt(1, 1);
        clicY = pt(1, 2);

        vertsX = get(h, 'XData');
        vertsY = get(h, 'YData');
        centroX = mean(vertsX);
        centroY = mean(vertsY);

        if strcmp(get(gcf, 'SelectionType'), 'normal')
            if abs(clicX - centroX) > abs(clicY - centroY)
                if clicX < centroX
                    moverBloque(h, 'Izquierda');
                else
                    moverBloque(h, 'Derecha');
                end
            else
                if clicY < centroY
                    moverBloque(h, 'Abajo');
                else
                    moverBloque(h, 'Arriba');
                end
            end
        elseif strcmp(get(gcf, 'SelectionType'), 'alt')
            RotarBloque(h);
        end
    end

    function moverBloque(h, direccion)
        while true
            if ~IntentarMover(h, direccion)
                break;
            end
        end
    end

    function exito = IntentarMover(h, direccion)
        exito = false;
        tiempo=1;
        pasoMovimiento = 1;

        vertsX = get(h, 'XData');
        vertsY = get(h, 'YData');

        switch direccion
            case 'Izquierda'
                nuevoX = vertsX - pasoMovimiento;
                nuevoY = vertsY;
            case 'Derecha'
                nuevoX = vertsX + pasoMovimiento;
                nuevoY = vertsY;
            case 'Arriba'
                nuevoX = vertsX;
                nuevoY = vertsY + pasoMovimiento;
            case 'Abajo'
                nuevoX = vertsX;
                nuevoY = vertsY - pasoMovimiento;
            otherwise
                return;
        end

        if ~VerificarSuperposicion(nuevoX, nuevoY, h) && DentroDeTablero(nuevoX, nuevoY)
            set(h, 'XData', nuevoX);
            set(h, 'YData', nuevoY);
            exito = true;
        end
        drawnow;
    end

    function RotarBloque(h)
        vertsXOriginal=get(h, 'XData');;
        vertsYOriginal=get(h, 'YData');;
        angulo = pi/2;
        listaAngulos=linspace(0,angulo,100);
        dAngulo=listaAngulos(2)-listaAngulos(1);
        for j=1:length(listaAngulos) - 1
          vertsX = get(h, 'XData');
          vertsY = get(h, 'YData');
          vertsComplex = vertsX + 1i * vertsY;
          centroComplejo = mean(vertsComplex);
          vertsRotados = (vertsComplex - centroComplejo) * (cos(dAngulo)+i*sin(dAngulo)) + centroComplejo;
          nuevosVertsX = real(vertsRotados);
          nuevosVertsY = imag(vertsRotados);
          if ~VerificarSuperposicion(nuevosVertsX, nuevosVertsY, h) && DentroDeTablero(nuevosVertsX, nuevosVertsY)
            set(h, 'XData', nuevosVertsX);
            set(h, 'YData', nuevosVertsY);
          else
            set(h, 'XData', vertsXOriginal);
            set(h, 'YData', vertsYOriginal);
            disp('Interseccion detectada. No se puede rotar.');
            break;
          end
          drawnow;
        endfor
    end

    function superposicion = VerificarSuperposicion(nuevosVertX, nuevosVertY, bloqueActual)
        superposicion = false;
        for i = 1:length(bloques)
            if bloques(i) ~= bloqueActual
                vertX_otro = get(bloques(i), 'XData');
                vertY_otro = get(bloques(i), 'YData');

                if PoligonosSuperpuestos(nuevosVertX, nuevosVertY, vertX_otro, vertY_otro)
                    superposicion = true;
                    return;
                end
            end
        end
    end

    function resultado = PoligonosSuperpuestos(vertX1, vertY1, vertX2, vertY2)
        resultado = false;
        if any(inpolygon(vertX1, vertY1, vertX2, vertY2)) || any(inpolygon(vertX2, vertY2, vertX1, vertY1))
            resultado = true;
        end
    end

    function dentro = DentroDeTablero(vertX, vertY)
        dentro = all(vertX >= -50 & vertX <= 50) && all(vertY >= -50 & vertY <= 50);
    end
end

