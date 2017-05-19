%%***************************************************************%%
% This function compares the monomials in mons and adds the rows  %
% of coefs, when the corresponding monomials in mons are equal    %
%%***************************************************************%%

function list = compCoef(mons,coefs,prec)

if nargin <3
    prec = 0;
end

% rng('default');

n = size(mons,2);
% fprintf(' \n compare %d monomials \n', n)
randvec = rand(n,1);
idvec = mons*randvec;
[testvec,sortidx] = sort(idvec,'ascend');
idxend = [0; find(diff([testvec; 1e10]) > 0)];
numnz = nnz(coefs);
row = 0; cnt = 0;
ii = zeros(numnz,1); jj = zeros(numnz,1); vv = zeros(numnz,1);
for k = 1:length(idxend)-1
    row = row+1;
    len = idxend(k+1)-idxend(k);
    idxtmp = cnt + [1:len];
    ii(idxtmp) = row;
    jj(idxtmp) = sortidx([idxend(k)+1 : idxend(k+1)]);
    vv(idxtmp) = 1;
    cnt = cnt + len;
end
ii = ii(1:cnt); jj = jj(1:cnt); vv = vv(1:cnt);
Emat = spconvert([ii,jj,vv; row,size(coefs,1),0]);
precold = digits;
if prec
digits(prec)
    list = Emat*coefs;
    list = double(list);
digits(precold)
else
    list = Emat*coefs;
end

% list(abs(list)<10^-6) = 0;
end
