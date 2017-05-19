function [pexp,ii,jj,vv] = putsum(pexp,ii,jj,vv,block,n,sossize,constraint)

if isempty(pexp)
    ict2=0; 
    jct=0;
else
    ict2 = max(ii);
    jct = max(jj);
end

[tmp11,tmp12] = sospol(block,n,sossize); % sparse format

for i = 1:size(tmp11,1)
    jct = jct+1;
    ict1 = ict2 +1;
    if nargin < 8
        tmp2 = [tmp11(i,:),tmp12(i)];
    else
        tmp2 = multpol([tmp11(i,:),tmp12(i)], constraint);
    end
    
    ict2 = ict1-1 + size(tmp2,1);
    
    pexp = [pexp;tmp2(:,1:n)];
    ii = [ii, ict1:ict2];
    jj = [jj, ones(1,ict2-ict1+1)*jct];
    vv = [vv, -tmp2(:,end)'];
end
