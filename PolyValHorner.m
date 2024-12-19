function yy=PolyValHorner(coeficientes,xx)
  n=length(coeficientes)-1;
  yy=zeros(size(xx));
  for i=1:length(xx)
    yy(i)=coeficientes(1);
    for ii=1:n
      yy(i)=yy(i)*xx(i)+coeficientes(ii+1);
      end
    end
  end
