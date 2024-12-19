function x=SolvQR(A,b)
  [Q,R]=QR(A);
  z=Q'*b;
  x=SolvTU(R,z);
end
