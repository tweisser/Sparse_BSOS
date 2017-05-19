function I = pattern(nn,oo,p)
% returns a sprsity pattern with blocks of size described in the vector nn 
% oo is the overlap between two blocks

if nargin <3
    p = length(nn);
else
    nn = ones(1,p)*nn(1);
end
    
I = cell(1,p);
ct2 = oo;
for l = 1:p
    ct1 = ct2-oo+1;
    ct2 = ct1 + nn(l)-1;
    I{l} = ct1:ct2;
 end