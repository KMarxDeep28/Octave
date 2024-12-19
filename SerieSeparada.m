function ressep = SerieSeparada(N)
  ressep=0;
  for i=1:2:N
     ressep = ressep + (1/i);
    end
  for i=2:2:N
     ressep = ressep - (1/i);
    end
end
