function determinante=Det10DM(L,U)
tamanio=size(L);
determinanteU=1;
determinanteL=1;
for i=1:tamanio
  determinanteL=determinanteL*L(i,i);
  determinanteU=determinanteU*U(i,i);
end
  determinante=determinanteL*determinanteU;
end
