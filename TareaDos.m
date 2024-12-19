function TareaDos
  LoadData;
  InitHome;
  Rotar(120,-60,60);
end

function LoadData
  angle=225:15:315;
  xa=1.125*cos(angle*pi/180);
  ya=1.125*sin(angle*pi/180);
  xb=[xa .875 .875 2.5 2.5 -2.5 -2.5 -.875 -.875];
  yb=[ya -.707107 -1.25 -1.25 -2.875 -2.875 -1.25 -1.25 -.707107];
  V0=[xb' yb'];
  F0=1:length(xb);
  E0=[0 0;1 0;0 1];
  %Eslabon 1
  l1=8.625;
  l2=l1;
  l3=6.125;
  angle=265:-15:105;
  xa=1.125*cos(angle*pi/180);
  ya=1.125*sin(angle*pi/180);
  angle=150:15:210;
  xc=8.625+1.125*cos(angle*pi/180);
  yc=1.125*sin(angle*pi/180);
  xL1=[0 7.1875 7.1875 7.72978 xc 7.72978 7.1875 7.1875 0 xa 0];
  yL1=[1.125 1.125 .875 .68133 yc -.68133 -.875 -1.125 -1.125 ya 1.125];
  V1=[xL1' yL1'];
  F1=1:length(xL1);
  %Eslabon 2
  V2=V1;
  F2=F1;
  %===============eslabón 3=========
  xL3=[0 2.875 3.125 3.125 4.875 6.625 6.6258 4.875 3.125 3.125 2.875 0 xa 0];
  yL3=[1.125*ones(1,3) .875 .875 .25 -.25 -.875 -.875 -1.125*ones(1,3) ya 1.125];
  V3=[xL3' yL3' ];
  F3=1:length(xL3);

  setappdata(0,'V0',V0);
  setappdata(0,'F0',F0);
  setappdata(0,'E0',E0);
  setappdata(0,'V1',V1);
  setappdata(0,'F1',F1);
  setappdata(0,'V2',V2);
  setappdata(0,'F2',F2);
  setappdata(0,'V3',V3);
  setappdata(0,'F3',F3);
  setappdata(0,'l1',l1);
  setappdata(0,'l2',l2);
  setappdata(0,'l3',l3);
end%LoadData

function InitHome
  V0=getappdata(0,'V0');
  F0=getappdata(0,'F0');
  V1=getappdata(0,'V1');
  F1=getappdata(0,'F1');
  V2=getappdata(0,'V2');
  F2=getappdata(0,'F2');
  V3=getappdata(0,'V3');
  F3=getappdata(0,'F3');
  l1=getappdata(0,'l1');
  l2=getappdata(0,'l2');
  l3=getappdata(0,'l3');

  E0=getappdata(0,'E0');
  %Crear figura para la base
  %set(0,'Units','pixels');
  %dim=get(0,'ScreenSize');
  %fig_0=figure('doublebuffer','on','Position',[0,35,dim(3)-200,dim(4)-110],...
  %'Name','Twolink planar robot(Base)',...
  %'NumberTitle','off');
  %hold on;
  figure(1);
  patch('vertices',V0,'faces',F0,'facecolor','r');
  patch('vertices',V1,'faces',F1,'facecolor','y');
  patch('vertices',V2,'faces',F2,'facecolor','g');
  patch('vertices',V3,'faces',F3,'Facec','b');
  daspect([1,1,1])
  xdata=E0([1 2],1);
  ydata=E0([1 2],2);
  line(xdata,ydata,'Color','r');
  xdata2=E0([1 3],1);
  ydata2=E0([1 3],2);
  line(xdata2,ydata2,'Color','g');
  figure(2);
  %Trasladar
  V2C=V2(:,1)+1j*V2(:,2);%Crea los numeros complejos
  E2C=E0(:,1)+1j*E0(:,2);
  d=0;
  V2C=V2C+d;
  E2C=E2C+d;
  V2W=[real(V2C) imag(V2C)];
  V3C=V3(:,1)+1j*V3(:,2);
  V3C=V3C+d+d;
  V3W=[real(V3C) imag(V3C)];
  E2=[real(E2C) imag(E2C)];
  L0=patch('vertices',V0,'faces',F0,'facecolor','r');
  L1=patch('vertices',V1,'faces',F1,'facecolor','y');
  L2=patch('vertices',V2W,'faces',F2,'facecolor','g');
  L3=patch('vertices',V3W,'faces',F3,'Facec','b');
  daspect([1,1,1]);
  line(xdata,ydata,'Color','r');
  line(xdata2,ydata2,'Color','g');
  xdataE2=E2([1 2],1);
  ydataE2=E2([1 2],2);
  %line(xdataE2,ydataE2,'Color','r');
  xdata2E2=E2([1 3],1);
  ydata2E2=E2([1 3],2);
  %line(xdata2E2,ydata2E2,'Color','g');
  E1=E0;
  setappdata(0,'E1',E1)
  setappdata(0,'E2',E2)
  setappdata(0,'V1',V1);
  setappdata(0,'F1',F1);
  setappdata(0,'V2',V2);
  setappdata(0,'F2',F2);
  setappdata(0,'V3',V3);
  setappdata(0,'F3',F3);
  setappdata(0,'L1',L1);
  setappdata(0,'L2',L2);
  setappdata(0,'L3',L3);
end%InitHome

function Rotar(theta1,theta2,theta3)
  V0=getappdata(0,'V0');
  F0=getappdata(0,'F0');
  V1=getappdata(0,'V1');
  F1=getappdata(0,'F1');
  V2=getappdata(0,'V2');
  F2=getappdata(0,'F2');
  V3=getappdata(0,'V3');
  F3=getappdata(0,'F3');
  l1=getappdata(0,'l1');
  l2=getappdata(0,'l2');
  l3=getappdata(0,'l3');
  E0=getappdata(0,'E0');
  E1=getappdata(0,'E1');
  E2=getappdata(0,'E2');
  L1=getappdata(0,'L1');
  L2=getappdata(0,'L2');
  L3=getappdata(0,'L3');
  %Convertir a Coordenadas homogeneas
  %VH1=[V1 ones(size(V1,1),1)];%Aumenta una columna de unos
  %VH2=[V2 ones(size(V2,1),1)];
  %Crear elemento de SE(2)
  T1=tmatC(theta1,0);
  V1C=V1(:,1)+1j*V1(:,2);
  VHC1=[V1C ones(size(V1C,1),1)];
  VHC1=VHC1*T1;
  V1W=[real(VHC1(:,1)) imag(VHC1(:,1))];

  T2=tmatC(theta2,l1);
  V2C=V2(:,1)+1j*V2(:,2);
  VHC2=[V2C ones(size(V2C,1),1)];
  VHC2=VHC2*T2*T1;
  V2W=[real(VHC2(:,1)) imag(VHC2(:,1))];

  T3=tmatC(theta3,l1);
  V3C=V3(:,1)+1j*V3(:,2);
  VHC3=[V3C ones(size(V3C,1),1)];
  VHC3=VHC3*T3*T2*T1;
  V3W=[real(VHC3(:,1)) imag(VHC3(:,1))];

  set(L1,'vertices',V1W);
  set(L2,'vertices',V2W);
  set(L3,'vertices',V3W);
end%Rotar

function[T]=tmatC(theta,d)
  theta=theta*pi/180;
  w=cos(theta)+1j*sin(theta);
  T=[w d;0 1].';%Sale transpuesto
end
