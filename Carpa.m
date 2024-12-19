function carpa=Carpa(xx,x,y)
  carpa=zeros(size(xx));
  for j=1:length(x)
    carpa=carpa + y(j)*CarpoJ(xx,x,j);
  endfor

  end
