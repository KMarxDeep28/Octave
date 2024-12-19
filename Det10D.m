function determinante=Det10D(L,U)
  determinanteL=prod(diag(L));
  determinanteU=prod(diag(U));
  determinante=determinanteL*determinanteU
end
