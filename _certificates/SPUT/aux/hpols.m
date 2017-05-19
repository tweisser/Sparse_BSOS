%%***********************************************************%%
% This function generates all polynomials h_{\alpha \beta}    %
% described in Section The Sparse Bounded-SOS-hierarchy       %
%%***********************************************************%%

function [HABd,nAB] = hpols(G,d)
m = length(G);
np1 = size(G{1},2);
n = np1-1;
pows = cell(2*m,1);

for i = 1:m
    pows{i} = powpol(G{i},d,2);
    Gpow = G{i}(:,1:n);
    Gcof = G{i}(:,np1);
    Gpow = [zeros(1,n);Gpow];
    Gcof = [1;-Gcof];
    GG = [Gpow,Gcof];
    pows{i+m} = powpol(GG,d,2);
end

AB = monomials(2*m,d);
nAB = size(AB, 1);
ABp1 = AB + ones(nAB,2*m);
HABd = cell(nAB,1);
for i = 1: nAB
    h = pows{1}{ABp1(i,1)};
    for j = 2: 2*m
        e = ABp1(i,j);
        if e > 1
        h = multpol(h,pows{j}{e});
        end
    end
    HABd{i}=h;
end



