function Lab4
LoadData
InitHome
Rotar(45,45, 0)
function LoadData
angle=225:15:315; % get rit of where links overlap
xa=1.125*cos(angle*pi/180);
ya=1.125*sin(angle*pi/180);
xb=[xa .875 .875 2.5  2.5 -2.5 -2.5 -.875 -.875];
yb=[ya -.707107 -1.25 -1.25 -2.875 -2.875 -1.25 -1.25 -.707107];
V0=[xb' yb'];  % Link3 matrix
F0=1:length(xb);
E0=[0 0; 1 0; 0 1];
%===== eslabón 1=============
l1=8.625; % distance between frame '1' and '2'
l2=l1; % distance between frame '2' and '3'
l3=6.125;               % distance between frame '3' and 'tool'
angle=265:-15:105; % define an arc from 270 to 90 degree r=1.125
xa=1.125*cos(angle*pi/180);
ya=1.125*sin(angle*pi/180);
angle=150:15:210; % get rit of where links overlap
xc=8.625+1.125*cos(angle*pi/180);
yc=1.125*sin(angle*pi/180);
xL1=[0 7.1875 7.1875 7.72978 xc 7.72978 7.1875 7.1875 0 xa 0];
yL1=[1.125 1.125 .875 .68133 yc -.68133 -.875 -1.125 -1.125 ya 1.125];
V1=[xL1' yL1'];  % Link1 matrix
F1=1:length(xL1);
%===============eslabón 2=========
xL2=[0 2.875 3.125 3.125 4.875 6.625 6.6258 4.875 3.125 3.125 2.875 0 xa 0];
yL2=[1.125*ones(1,3) .875 .875 .25 -.25 -.875 -.875 -1.125*ones(1,3) ya 1.125];
V2=[xL2' yL2' ];
F2=1:length(xL2);

%NUEVO
%===============eslabón 3=========
xL3=[0 2.875 3.125 3.125 4.875 6.625 6.6258 4.875 3.125 3.125 2.875 0 xa 0];
yL3=[1.125*ones(1,3) .875 .875 .25 -.25 -.875 -.875 -1.125*ones(1,3) ya 1.125];
V3=[xL3' yL3' ];
F3=1:length(xL3);
%NUEVO

setappdata(0,'V0',V0)
setappdata(0,'F0',F0)
setappdata(0,'E0',E0)
setappdata(0,'V1',V1);
setappdata(0,'F1',F1);
setappdata(0,'V2',V2);
setappdata(0,'F2',F2);
%NUEVO
setappdata(0,'V3',V3);
setappdata(0,'F3',F3);
%NUEVO
setappdata(0,'l1',l1);
setappdata(0,'l2',l2);
setappdata(0,'l3',l3);
end%LoadData
function InitHome
    % Cargar los getappdata necesarios
    V0 = getappdata(0,'V0');
    F0 = getappdata(0,'F0');
    V1 = getappdata(0,'V1');
    F1 = getappdata(0,'F1');
    V2 = getappdata(0,'V2');
    F2 = getappdata(0,'F2');
    V3 = getappdata(0,'V3'); % Nuevo
    F3 = getappdata(0,'F3'); % Nuevo
    l1 = getappdata(0,'l1');
    l2 = getappdata(0,'l2');
    l3 = getappdata(0,'l3');
    
    E0 = getappdata(0,'E0');

    % Crear la figura para la base (Matlab figure)
    set(0,'Units','pixels');
    dim = get(0,'ScreenSize');
    fig_0 = figure('doublebuffer','on','Position',[0,35,dim(3)-200,dim(4)-110],...
        'Name','Twolink planar robot (Base)',...
        'NumberTitle','off');
    hold on
    patch('vertices',V0,'faces',F0,'Facec','r');
    daspect([1 1 1]);

    % Dibujar el eslabón 1
    patch('vertices',V1,'faces',F1,'Facec','y');

    % Dibujar el eslabón 3 (nuevo) detrás del eslabón 2
    patch('vertices',V3,'faces',F3,'Facec','g'); % Eslabón 3 se dibuja aquí

    % Dibujar el eslabón 2 encima del eslabón 3
    patch('vertices',V2,'faces',F2,'Facec','b');

    Xdata = E0([1 2],1);
    Ydata = E0([1 2],2);
    line('XData',Xdata,'YData',Ydata,'Color','r');
    Xdata = E0([1 3],1);
    Ydata = E0([1 3],2);
    line('XData',Xdata,'YData',Ydata,'Color','g');

    fig_E = figure('doublebuffer','on','Position',[0,35,dim(3)-200,dim(4)-110],...
        'Name','Twolink planar robot (Ensamblado)',...
        'NumberTitle','off');

    % Trasladar y transformar el eslabón 2
    V2C = V2(:,1) + 1j*V2(:,2); % Crea los números complejos
    E2C = E0(:,1) + 1j*E0(:,2);
    d = l1 + 1j*0;
    V2C = V2C + d;
    E2C = E2C + d;
    
    L0 = patch('vertices',V0,'faces',F0,'Facec','r');
    daspect([1 1 1]);

    % Transformar y dibujar el eslabón 1
    L1 = patch('vertices',V1,'faces',F1,'Facec','y');

    % Transformar y dibujar el eslabón 3
    V3C = V3(:,1) + 1j*V3(:,2); % Crea los números complejos
    E3C = E2C; % El eslabón 3 se conecta con el eslabón 2
    d = l2 + 1j*0;
    V3C = V3C + d;
    E3C = E3C + d;
    V3W = [real(V3C) imag(V3C)];
    E3 = [real(E3C) imag(E3C)];
    L3 = patch('vertices',V3W,'faces',F3,'Facec','g');

    % Transformar y dibujar el eslabón 2 sobre el eslabón 3
    V2W = [real(V2C) imag(V2C)];
    E2 = [real(E2C) imag(E2C)];
    E1 = E0;
    L2 = patch('vertices',V2W,'faces',F2,'Facec','b');

    Xdata = E0([1 2],1);
    Ydata = E0([1 2],2);
    line('XData',Xdata,'YData',Ydata,'Color','r');
    Xdata = E1([1 3],1);
    Ydata = E1([1 3],2);
    line('XData',Xdata,'YData',Ydata,'Color','g');

    setappdata(0,'E1',E1);
    setappdata(0,'E2',E2);
    setappdata(0,'E3',E3); % Nuevo
    setappdata(0,'V1',V1);
    setappdata(0,'F1',F1);
    setappdata(0,'V2',V2);
    setappdata(0,'F2',F2);
    setappdata(0,'V3',V3); % Nuevo
    setappdata(0,'F3',F3); % Nuevo
    setappdata(0,'L1',L1);
    setappdata(0,'L2',L2);
    setappdata(0,'L3',L3); % Nuevo
end

function Rotar(theta1, theta2, theta3)
    V1 = getappdata(0,'V1');
    F1 = getappdata(0,'F1');
    V2 = getappdata(0,'V2');
    F2 = getappdata(0,'F2');
    V3 = getappdata(0,'V3'); % Nuevo
    F3 = getappdata(0,'F3'); % Nuevo
    l1 = getappdata(0,'l1');
    l2 = getappdata(0,'l2');
    l3 = getappdata(0,'l3');
    E1 = getappdata(0,'E1');
    E2 = getappdata(0,'E2');
    E3 = getappdata(0,'E3'); % Nuevo
    L1 = getappdata(0,'L1');
    L2 = getappdata(0,'L2');
    L3 = getappdata(0,'L3'); % Nuevo

    % Rotación para el eslabón 1
    T_01 = tmatC(theta1, 0);
    V1C = V1(:,1) + 1j*V1(:,2); % Crea los números complejos
    VHC1 = [V1C ones(size(V1C,1),1)]; % Aumenta una columna de unos
    VHC1 = VHC1 * T_01; % Rotando el eslabón 1
    V1W = [real(VHC1(:,1)) imag(VHC1(:,1))]; % Recuperar las coordenadas
    set(L1, 'vertices', V1W);

    % Rotación para el eslabón 2
    T_12 = tmatC(theta2, l1);
    V2C = V2(:,1) + 1j*V2(:,2); % Crea los números complejos
    VHC2 = [V2C ones(size(V2C,1),1)]; % Aumenta una columna de unos
    T_02 = T_12 * T_01; % Componer con la transformación del eslabón 1
    VHC2 = VHC2 * T_02; % Rotando y trasladando el eslabón 2
    V2W = [real(VHC2(:,1)) imag(VHC2(:,1))]; % Recuperar las coordenadas
    set(L2, 'vertices', V2W);

    % Rotación para el eslabón 3
    T_23 = tmatC(theta3, l2);
    V3C = V3(:,1) + 1j*V3(:,2); % Crea los números complejos
    VHC3 = [V3C ones(size(V3C,1),1)];
    T_03 = T_23 * T_12 * T_01; % Componer con las transformaciones anteriores
    VHC3 = VHC3 * T_03;
    V3W = [real(VHC3(:,1)) imag(VHC3(:,1))]; % Recuperar las coordenadas
    set(L3, 'vertices', V3W);
end

function [T] = tmatC(theta, d)
    % Matriz de transformación para la rotación theta y la traslación d
    T = [exp(1j*theta) d; 0 1];
end
end