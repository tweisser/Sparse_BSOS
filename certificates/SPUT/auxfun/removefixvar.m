%%**************************************************************%%
% remove fixed variables in SDP problem corresponding to SBSOS   %
% author: Kim-Chuan Toh / Tillmann Weisser                       %
% date: 29 Mar 2016 /13 Apr 2016                                 %
%%**************************************************************%%

function [blk2,At2,C2,b2,R,scols,m2] = removefixvar(blk,At,C,b,nspcons,RecoverData)
    %% tw: analysis

    numblk = size(blk,1);
    numvar = zeros(1,numblk);
    for p=1:numblk
        pblk = blk(p,:);
        if strcmp(pblk{1},'s')
            numvar(p) = sum(pblk{2}.*(pblk{2}+1))/2;
        else
            numvar(p) = sum(pblk{2});
        end
    end
    m = length(b);
    ncert = m-nspcons;

    %% tw: find fixed variables in last block

    Atp= sparse(At{numblk});
    Atp1 = Atp(:,1:ncert);
    Atp2 = Atp(:,ncert+1:m);

    e = ones(1,size(Atp2,1));
    eAtp2 = e*spones(Atp2);
    colfixvar = find(eAtp2==1);
    nfixvar = length(colfixvar);

    %% find row of fixed variables in Atp and col for corresponding constraint

    [rowfixvar,~] = find(Atp2(:,colfixvar));
    colfixvar = colfixvar + ncert;
    [colkeepvar,~]= find(Atp1(rowfixvar,:)');

    keeprowsAtp = setdiff(1:numvar(numblk),rowfixvar);
    keepcols = setdiff(1:m,colfixvar);

    %% tw: manipulation of blk, At, C, b

    blk2 = blk;
    At2 = cell(numblk,1); C2 = cell(numblk,1);

    for p = 1:numblk-1
        At2{p} = At{p}(:,keepcols);
        C2{p} = C{p};
    end

    blk2{numblk,2} = length(keeprowsAtp);
    At2{numblk} = At{numblk}(keeprowsAtp,keepcols);
    C2{numblk} = C{numblk}(keeprowsAtp);

    if any(C{numblk}(rowfixvar)); error('constant has changed'); end;

    b2 = b;
    b2(colkeepvar) = b(colkeepvar) - b(colfixvar);
    b2 = b2(keepcols);

    b2 = full(b2);

    fprintf('\n Removed %2.0f fix variables',nfixvar);

    % remove zero columns
    m2 = length(b2);
    ecols = (sum(cell2mat(At2)~=0)==0);
    if any(b2(ecols))
        error('system infeasible')
    else
        for p = 1:numblk
            At2{p}(:,ecols)=[];
        end
        b2(ecols)=[];
    end
    
    %% tkc:remove empty blk

    emptyblk = [];
    for p=1:numblk
        if (blk2{p,2}==0)
            emptyblk = [emptyblk,p];
        end
    end
    if ~isempty(emptyblk)
        fprintf('\n Removed %2.0f empty block',length(emptyblk));
    end

    nonemptyblk = setdiff([1:numblk],emptyblk);
    blk2 = blk2(nonemptyblk,:);
    At2 = At2(nonemptyblk);
    C2 = C2(nonemptyblk);

    %% tw: way to recover dual variable
    
    if RecoverData

        fixkeep = [colfixvar,keepcols];
        [~,id] = sort(fixkeep);

        [~,ia,ib] = intersect(keepcols,colkeepvar);
        ic = zeros(1,nfixvar);
        ic(ib)=ia;

        keepkeep = [ic,1:length(keepcols)];
        oj = keepkeep(id);
        oneone = ones(1,m);
        oneone(1:nfixvar) = -oneone(1:nfixvar);
        ov = oneone(id);

        R = sparse(1:m,oj,ov,m,length(keepcols));
        tmp = 1:m2;
        scols = tmp(ecols==0);
    else
        R = sparse(m,length(keepcols));
        scols = 1:m2;
    end
end
%%*********************************************************************


