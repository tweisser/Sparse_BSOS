function [ GG,JJ ] = G2GG( G,J )
if isempty(G)
    GG = G;
    JJ = J;
else
    m = length(G);
    GG= cell(1,2*m);
    np1 = size(G{1},2);
    for i = 1:m
        GG{i} = G{i};
        GG{i+m} = [G{i};sparse(1,np1-1),-1];
        GG{i+m}(:,end) = -GG{i+m}(:,end); 
    end
    p = length(J);
    JJ = cell(1,p);
    for i = 1:p
        JJ{i} = [J{i},J{i}+m];
    end
end

