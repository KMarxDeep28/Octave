function p=PermEl(n,i,j)
  p=1:n;
  p([i,j])=p([j,i]);
  %p(i)=j;
  %p(j)=i;
  end
