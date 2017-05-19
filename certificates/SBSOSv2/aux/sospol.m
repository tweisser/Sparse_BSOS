%%***************************************************************%%
% This function generates an sos polynomial in the variables I of %
% degree k and lifts the result to a polynomial in n variables    %
% Author: Tillmann Weisser
%%***************************************************************%%

function [exponents, coeffs] = sospol(I,n,k)
ni = length(I);
moms = monomials(ni,k);
ct = 0;
s = size(moms,1);
exponents = zeros(s*(s+1)/2,ni);
coeffs = ones(s*(s+1)/2,1)*sqrt(2);
for i = 1:s
    for j = 1:i
       ct = ct + 1;
       exponents(ct,:) = moms(i,:)+moms(j,:);
    end
    coeffs(ct) = 1;
end
exponents = lift(exponents', I, n);
exponents = exponents';
end
