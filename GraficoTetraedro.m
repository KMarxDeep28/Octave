function r=GraficoTetraedro(lado=5, colorSombra=0)
  V=[1,1,1;
  1,-1,-1;
  -1,1,-1;
  -1,-1,1] * (lado/sqrt(2));
  F=[1,2,3;
  1,2,4;
  1,3,4;
  2,3,4];
  cara=[192 192 192]/255;
  sombra=[colorSombra colorSombra colorSombra];
  c=[cara; cara; cara; sombra];
  patch('vertices', V, 'faces', F, 'facecolor', 'flat', 'FaceVertexCData', c);
  end
