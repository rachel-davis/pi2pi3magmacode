V:=[g10,g11,g12,g13,g20,g21,g22,g23,g30,g31,g32,g33];
Y:=VectorSpaceWithBasis([q(g10), q(g11), q(g12), q(g13), q(g20), q(g21), q(g22), q(g23), q(g30), q(g31), q(g32), q(g33)]);

function m12(z)
R:=AssociativeArray();
for i:=1 to 12 do R[i]:=Coordinates(Y, q(vec1(z*el(V[i]))) ); end for;
M:=Matrix(GF(p), 12, 12, [R[i]: i in {1..12}]);
return M;
end function;

Z2:={};
for z in Z do Z2:=Include(Z2,el(z) ); end for;
V66:=VectorSpace(GF(p),66);
count:=0;
Zlist:={};
Vlist:={};
pairs:=0;
for z in Z2 do for k in U do 
count:=count+1; print count, #Zlist, #Vlist, pairs;
if k ne V66!0 then
if V66!k*(Erho2*ExteriorSquare(m12(z))) eq 2*V66!k then print z, k; 
pairs:=pairs+1;
Zlist:=Include(Zlist, z); 
Vlist:=Include(Vlist, k);
end if;
end if;
end for; end for; 

ms:={}; for z in Zlist do ms:=Include(ms, m12(z-1)); end for;
ms;
z:=Random(Zlist);
Kr:=Kernel(m12(z-1));
K:=Kernel(M0-1) meet Kernel(M1-1) meet Kernel(M2-1);
K meet Kr;
