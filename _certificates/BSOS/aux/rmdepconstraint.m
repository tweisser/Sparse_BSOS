%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function [blknew,Atnew,bnew,idx] = rmdepconstraint(blk,At,b)

    m = size(At{2,1},2);
    AAt = zeros(m);
    V = At{1,2}; 
    for j = 1:m
       tmp = V'*V(:,j); 
       AAt(:,j) = tmp.*tmp;
    end
    AAt = AAt + At{2,1}'*At{2,1};
    AAt = AAt + At{3,1}'*At{3,1};
    const = norm(AAt,'fro')/norm(b)^2; 
    AAt = AAt + const*(b*b');
    AAt = 0.5*(AAt+AAt');
    eigAAt = eig(AAt);
    
    idx = find(eigAAt > 1e-14*max(eigAAt));  
    fprintf('\n number of independent constraints = %3.0f\n',length(idx));
    if (false)
       semilogy(eigAAt,'*'); hold on;
       semilogy(idx,eigAAt(idx),'or'); hold off;
    end
    blknew = blk;
    blknew{1,3} = blk{1,3}(idx); 
    Atnew = At;
    Atnew{1,2} = At{1,2}(:,idx);
    Atnew{1,3} = At{1,3}(idx,:);
    Atnew{2,1} = At{2,1}(:,idx);
    Atnew{3,1} = At{3,1}(:,idx);
    bnew = b(idx);    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%