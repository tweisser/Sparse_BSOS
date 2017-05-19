%%*******************************************************%%
% This function computes the ranks of all moment matrices %
% corresponding to the given moment matrices.             %
%%*******************************************************%%    

function [RANK, mineig] = rankSPUT(YY,I,degfg,reldeg)

p = length(YY);
EIGS = cell(1,p);
RANK = zeros(1,p);
for i = 1:p
    MM = momentmatrix(YY{i},length(I{i}),2*reldeg);
    eigMM = eig(MM);  
    %validate
    smalltol = 1e-5*max(abs(eigMM));
    rankMM = length(find(eigMM > smalltol));
    EIGS{1,i} = eigMM;
    RANK(1,i) = rankMM;
    if (rankMM >1)&&(2*reldeg-degfg>=rankMM)
        MM = momentmatrix(YY{i},length(I{i}),2*reldeg);
        eigMM = eig(MM);  
        %validate
        smalltol = 1e-5*max(abs(eigMM));
        rankMM = length(find(eigMM > smalltol));
        EIGS{2,i} = eigMM;
        RANK(2,i) = rankMM;
    end
end
if size(RANK,1)>1
    if ~any(RANK(1,:)-RANK(2,:))
        fprintf('\n multiple optimal solutions suspected \n')
    end
end

mineig = min(cellfun(@min,EIGS(1,:)));

