function GraficoCuboRubik()
    vertices = [0 0 0;
                1 0 0;
                1 1 0;
                0 1 0;
                0 0 1;
                1 0 1;
                1 1 1;
                0 1 1];
    faces = [1 2 3 4;
             5 6 7 8;
             1 2 6 5;
             2 3 7 6;
             3 4 8 7;
             4 1 5 8];
    faceColors = [1 0 0;
                  0 1 0;
                  0 0 1;
                  1 1 0;
                  1 0.5 0;
                  1 1 1];
    hold on;
    axis equal;
    view(3);
    for i = 0:2
        for j = 0:2
            for k = 0:2
                v = vertices + [i j k];
                for f = 1:6
                    patch('Vertices', v, 'Faces', faces(f,:), 'FaceColor', faceColors(f,:), ...
                          'EdgeColor', 'k');
                end
            end
        end
    end
    hold off;
end

