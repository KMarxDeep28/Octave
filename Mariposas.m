function Mariposas
LoadData
LoadDataG
InitHome
%pause(2)
for ii=1:100,
    Evol
   pause(.2)
end
    function LoadData
        r=3.9;% Tasa combinada de reproducci�n y mortandad
        x0=.8;%Poblaci�n inicial, respecto a la capacidad de carga
        setappdata(0,'r',r)
        setappdata(0,'x0',x0)
    end%LoadData
function LoadDataG
        V=[0 0;1 0];
        setappdata(0,'V',V)
    end%LoadDataG
    function InitHome
        V=getappdata(0,'V');
        r=getappdata(0,'r');
        x0=getappdata(0,'x0');
        figure
        subplot(1,2,1)
        hold on
        axis off
        X=[V(:,1)];
        Y=[V(:,2)];
        HG=line(X,Y);
        Hq=plot(x0,0,'or');
        subplot(1,2,2)
        hold on
        HP=plot(0,x0);
        %%%%%%
        qOld=x0;
        tOld=x0;
        setappdata(0,'HG',HG)
        setappdata(0,'HP',HP)
        setappdata(0,'Hq',Hq)
        setappdata(0,'qOld',qOld)
        setappdata(0,'tOld',tOld)
        %%%%%%
    end%InitHome
    function Evol
        r=getappdata(0,'r');
        qOld=getappdata(0,'qOld');
        tOld=getappdata(0,'tOld');
        Hq=getappdata(0,'Hq');
        HP=getappdata(0,'HP');
        q=r*qOld*(1-qOld);
        set(Hq,'Xdata',q)
        X=get(HP,'Xdata');
        Y=get(HP,'Ydata');
        set(HP,'Xdata',[X tOld+1],'Ydata',[Y q])
        qOld=q;
        tOld=tOld+1;
        setappdata(0,'qOld',qOld)
        setappdata(0,'tOld',tOld)
    end%EvolG

end%Mariposas
