%%***************************************************************%%
% This function generates a list of all powers of the polynomial  %
% pol up to power n                                               %
%%***************************************************************%%

function [pset] = powpol(pol,n,output)

if nargin <3
    output = 2;
end

np1 = size(pol,2);
onepol = [zeros(1,np1-1), 1];
pset= cell(n+1,1);
pset{1} = onepol;
for i = 1 : n
    pset{i+1} = multpol(pol,pset{i});
end

if output == 1
    pset = pset{n+1};
end

