%%***********************************************************%%
% This function builds all moment sequences corresponding to  
% the different blocks of variables present in the sparsity   
% pattern.      
%% Author: Tillmann Weisser                                   
%%***********************************************************%%    

function YY = getmoments(y,At,I,maxdeg,nspcons)

p = length(I);
YY= cell(1,p);

at=At{end}(:,end-nspcons :end);
yy = at*y(end-nspcons :end);
yct = 0;
if length(maxdeg)>1
    if ~length(maxdeg)==p
        error('certificate wrong')
    end
for i = 1:p
    nm = nchoosek(length(I{i})+maxdeg(i),maxdeg(i));
    yi = zeros(nm,1);
    for j = 1:nm
       yct = yct +1;
       yi(j) = - yy(yct);
    end
    YY{i} = yi;
end
else
for i = 1:p
    nm = nchoosek(length(I{i})+maxdeg,maxdeg);
    yi = zeros(nm,1);
    for j = 1:nm
       yct = yct +1;
       yi(j) = - yy(yct);
    end
    YY{i} = yi;
end
end
end

