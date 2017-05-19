%%***************************************************************%%
% This function builds the product r of to polynomials p and q.   %
% The resulting polynomial r is not simplified, i.e. r is likely  %
% to have several entries for the same monomial. (internal use)   %
% Author: Tillmann Weisser
%%***************************************************************%%

function r = multpol(p,q)

[mp, np1] = size(p);
[mq, nq1] = size(q);
if ~(np1 ==nq1)
    error('number of variables does not coincide')
end

r = zeros(mp*mq,np1);
n = np1-1;
P = p(:,1:n);
Q = q(:,1:n);

for i = 1:mp
    for j = 1:mq
        r((i-1)*mq +j,1:n) = P(i,:)+Q(j,:);
        r((i-1)*mq +j,np1) = p(i,np1)*q(j,np1);
    end
end
end
