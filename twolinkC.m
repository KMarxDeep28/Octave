function twolinkC%twolinkC
LoadData;
InitHome;
%n=200;
%K_p=unipanel()

    function LoadData
       angle=225:15:315;
       xa=1.125*cos(angle*pi/180);
       ya=1.125*sin(angle*pi/180);
       xb=[xa .875 .875 2.5 2.5 -2.5 -2.5 -.875 -.875];
       yb=[ya -.707107 -1.25 -1.25 -2.875 -2.875 -1.25 -1.25 -.707107];
       V0=[xb' yb'];% zeros(size(xb))' ones(size(xb))'];
       F0=1:length(xb);
       %patch('vertices',V0,'faces',F0,'facecolor', 'r')
       %daspect([ 1 1 1]);
       %hold on
       E0=[0 0; 1 0; 0 1];
       setappdata(0,'V0',V0);
       setappdata(0,'F0',F0);
       setappdata(0,'E0',E0);
       
       %xdata=E0([1,2],1);
       %ydata=E0([1,2],2);
       %line(xdata, ydata, 'color','r')
       %xdata=E0([1,3],1);
       %ydata=E0([1,3],2);
       %line(xdata, ydata, 'color','g')
    end%LOADDATA

    function InitHome
       V0=getappdata(0,'V0');
       F0=getappdata(0,'F0');
       E0=getappdata(0,'E0');
       %crear figura de base
       set(0,'units','pixels');
       dim = get(0,'ScreenSize');
       fig_0=figure('doublebuffer','on','Position',[0,35,dim(3)-200,dim(4)-110],'Name','Twolink planar robot(Base)',...
           'NumberTitle','off');
       hold on
       patch('vertice',V0,'faces',F0,'facec','r');
       daspect([ 1 1 1]);
       Xdata=E0([1,2],1);
       Ydata=E0([1,2],2);
     
       
       
       line(Xdata, Ydata, 'color','r')
       Xdata=E0([1,3],1);
       Ydata=E0([1,3],2);
       line(Xdata, Ydata, 'color','g')
       
    end
end%twoLinkC

