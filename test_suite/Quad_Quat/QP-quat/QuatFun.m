function pop = QuatFun(I)
% This function creates a quartic function based on QuadFun

pop = QuadFun(I);
ii = [1:pop.n, 1:pop.n];
jj = [1:pop.n, ones(1,pop.n)+pop.n];
vv = [4*ones(1,pop.n),2*rand(1,pop.n)-1];

pop.F = [pop.F; sparse(ii,jj,vv)];
