function r=GraficoCubo(lado, colorSombra = 0)
  V=[lado,-lado,lado;
  lado,lado,lado;
  -lado,lado,lado;
  -lado,-lado,lado;
  lado,-lado,-lado;
  lado,lado,-lado;
  -lado,lado,-lado;
  -lado,-lado,-lado];
  F=[1,2,3,4;
  4,8,5,1;
  1,5,6,2;
  3,4,8,7;
  3,7,6,2;
  7,8,5,6];
  cara=[192 192 192]/255;
  sombra=[colorSombra colorSombra colorSombra];
  c=[cara;cara;cara;sombra;sombra;sombra];
  patch('vertices',V,'faces',F,'facecolor','flat','FaceVertexCData',c);
  end
