function yy=CJ(xx,x,j);
  yy=zeros(size(xx));
  if j~=1
    indice=xx>=x(j-1) & xx<=x(j);
    yy(indice) = (xx(indice) - x(j-1))/(x(j) - x(j-1));
  endif
  if j~=length(x)
    indice=xx>=x(j) & xx<=x(j+1);
    yy(indice)=(xx(indice)-x(j+1))/(x(j)-x(j+1))
  endif
end
