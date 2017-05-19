function pop = QuadFun(I)
% This function creates a quadratic function respecting sparsity pattern I.

n = max(cell2mat(I));
minI = cellfun(@min,I);
maxI = cellfun(@max,I);
ii = []; jj = [];
for i=1:n
    l = find(minI<=i);
    l=l(end);
    ii = [ii i*(ones(1,maxI(l)-i+1))];
    jj = [jj i:maxI(l)];
end
vv = 2*rand(size(ii))-1;
A=sparse(ii,jj,vv,n,n);

A = (A+ A');
A= A-diag(diag(A)'./2);

eigs = eig(A);

fprintf('\n pos eig val: %d \n neg eig val: %d\n', length(eigs(eigs>0)),length(eigs(eigs<0)))

if eigs(1)*eigs(end)>0
    error('Matrix definite')
end

ii = [];jj = [];vv = [];
np1 = n+1;
ct = 0;
for i = 1:n 
    for j = i:n
        if A(i,j)
        ct = ct+1;
        if i == j
            ii = [ii ct ct];
            jj = [jj i np1];
            vv = [vv 2 A(i,j)];
        else
            ii = [ii ct ct ct];
            jj = [jj i j  np1];
            vv = [vv 1 1 2*A(i,j)];
        end
        end
    end
end

ii = [ii ct+(1:n) ct+(1:n)];
jj = [jj 1:n np1*ones(1,n)];
vv = [vv ones(1,n) 2*rand(1,n)-1];

F = [sparse(ii,jj,vv)];

pop.A = A;
pop.eigs = eigs;
pop.F = F;
pop.n = n;
pop.I = I;