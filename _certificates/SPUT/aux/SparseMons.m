%%**************************************************************%%
% This function generates all monomials of degree less or equal  %
% than deg in n variables, only considering the variables listed %
% in I.                                                          %
%%**************************************************************%%

function [list,mons] = SparseMons(n,deg,I)
nI = length(I);
k = nchoosek(nI+deg,deg);
list = sparse(k,n);
mons = monomials(nI,deg);
list(:,I) = mons;
end