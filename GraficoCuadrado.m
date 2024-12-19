function r=GraficoCuadrado(lado = 1)
  V=[lado,lado;
  -lado,lado;
  -lado,-lado;
  lado,-lado];
  V2=V+[1 0];
  V3=V +[2 0];
  V4=V+[0 1];
  V5=V + [1 1];
  V6=V + [2 1];
  V7=V + [0 2];
  V8=V + [1 2];
  V9=V + [2 2];
  F=[1,2,3,4];
  cara=[3 219 252]/255;
  figure;
  hold on;
  patch('vertices',V,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  patch('vertices',V2,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  patch('vertices',V3,'faces',F,'facecolor','flat','FaceVertexCData',cara/3);
  patch('vertices',V4,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  patch('vertices',V5,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  patch('vertices',V6,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  patch('vertices',V7,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  patch('vertices',V8,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  patch('vertices',V9,'faces',F,'facecolor','flat','FaceVertexCData',cara);
  end
