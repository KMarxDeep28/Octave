function DiagramaBifurcacion
    LoadData;
    InitHome;

    function LoadData
      figure;
        n_iter = 100;
        n_ultimo = 50;
        x0 = 0.5;
        r_min = 0;
        r_max = 4;
        n_r = 1000;

        setappdata(0, 'n_iter', n_iter);
        setappdata(0, 'n_ultimo', n_ultimo);
        setappdata(0, 'x0', x0);
        setappdata(0, 'r_min', r_min);
        setappdata(0, 'r_max', r_max);
        setappdata(0, 'n_r', n_r);
    end

    function InitHome
        n_iter = getappdata(0, 'n_iter');
        n_ultimo = getappdata(0, 'n_ultimo');
        x0 = getappdata(0, 'x0');
        r_min = getappdata(0, 'r_min');
        r_max = getappdata(0, 'r_max');
        n_r = getappdata(0, 'n_r');

        r_valores = linspace(r_min, r_max, n_r);

        r_plot = [];
        x_plot = [];

        for i = 1:length(r_valores)
            r = r_valores(i);
            x = x0;
            for j = 1:n_iter
                x = r * x * (1 - x);
                if j > (n_iter - n_ultimo)
                    r_plot = [r_plot; r];
                    x_plot = [x_plot; x];
                end
            end
        end

        plot(r_plot, x_plot, 'b.', 'MarkerSize', 1);

    end
end

