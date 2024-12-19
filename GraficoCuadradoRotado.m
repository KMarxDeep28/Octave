function r=GraficoCuadradoRotado(lado=5, angulo=pi/4)
  V=[lado,lado;
  -lado,lado;
  -lado,-lado;
  lado,-lado];
  z=cos(angulo) + i*sin(angulo);
    F=[1,2,3,4];
  cara=[3 219 252]/255;
  Zv=V(:,1) + i*V(:,2);
  ZVR=Zv*z;
  VWZ=[real(ZVR) imag(ZVR)];
  patch('vertices',VWZ,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  daspect([1 1 1]);
  end
