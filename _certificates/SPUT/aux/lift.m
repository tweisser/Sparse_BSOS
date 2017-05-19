%%************************************************************%%
% This function lifts a polynomial in the variables of I to a  %
% polynomial in n variables.                                   %
%%************************************************************%%

function [xlift] = lift(x,I,n)
m = size(x,2);
xlift = sparse(n,m);
xlift(I,:) = x;
end