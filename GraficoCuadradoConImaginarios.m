function r=GraficoCuadradoConImaginarios(lado=1)
  V=[lado,lado;
  -lado,lado;
  -lado,-lado;
  lado,-lado];
  Zv=V(:,1) + i*V(:,2);
  Zv2=Zv+i;
  VW=[real(Zv) imag(Zv)];
  VW2=[real(Zv2) imag(Zv2)];
  F=[1,2,3,4];
  cara=[3 219 252]/255;
  figure;
  hold on;
  patch('vertices',VW,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  patch('vertices',VW2,'faces',F,'facecolor','flat','FaceVertexCData',cara/3);
  end
