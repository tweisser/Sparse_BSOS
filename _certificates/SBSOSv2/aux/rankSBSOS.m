%%*******************************************************%%
% This function computes the ranks of all moment matrices %
% corresponding to the given moment matrices.             %
%%*******************************************************%%    

function [RANK, mineig] = rankSBSOS(YY,I,degfg)
ranktol = 1e-5;
fprintf('\nranktol is %1.1e\n',ranktol)
p = length(YY);
EIGS = cell(1,p);
RANK = zeros(1,p);
for i = 1:p
    MM = momentmatrix(YY{i},length(I{i}),degfg);
    eigMM = eig(MM);  
    %validate
    smalltol = ranktol*max(abs(eigMM));
    rankMM = length(find(eigMM > smalltol));
    %fprintf('rank of M%d(y) = %2.0f, mineigM = %3.2e\n',i,rankMM,min(eigMM));
    EIGS{i} = eigMM;
    RANK(i) = rankMM;
end
mineig = min(cellfun(@min,EIGS));
