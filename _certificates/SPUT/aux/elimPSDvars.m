function [bblk,AAt,CC,b] = elimPSDvars( blk,At,C,b )
%this function searches for 1x1 psd variables and converts them to non
%negative variables
p = size(blk,1);
ct = 0;
ch = 0;
varct = 0;
for i = 1:p
    if strcmp(blk{i,1},'s')
        idxx = find(blk{i,2} ==1);
        idqx = cumsum(blk{i,2});
        idql = idqx(idxx);
        idqs = setdiff(1:idqx(end),idql);
        idx= (blk{i,2}.*(blk{i,2}+1))./2;
        onevars = find(idx==1);
        
        pid = cumsum(idx);
        onepid=pid(onevars);
        nonepid = setdiff(1:size(At{i},1),onepid);
        
        if any(blk{i,2}>1)
            ct = ct+1;
            AAt{ct}=At{i}(nonepid,:);
            bblk{ct,1} = 's';
            bblk{ct,2} = blk{i,2}(blk{i,2}>1);
            CC{ct} = C{i}(idqs,idqs);
        end
        
        if ~isempty(idxx)
            ct = ct+1;
            AAt{ct}=At{i}(onepid,:);
            bblk{ct,1} = 'l';
            bblk{ct,2} = length(onevars);
            CC{ct}=diag(C{i}(idql,idql));
            ch = ch + bblk{ct,2};
        end
        varct = varct + pid(end);
        
    else
        ct = ct+1;
        bblk{ct,1}=blk{i,1};
        bblk{ct,2}=blk{i,2};
        AAt{ct}=At{i};
        CC{ct} = C{i};
        varct = varct+sum(bblk{ct,2});
    end
end

fprintf('\n Changed %d psd variables to non negative variables',ch);

end

