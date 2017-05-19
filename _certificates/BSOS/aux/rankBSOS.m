function [rankMM, mineig] = rankBSOS(n,s,y,xrand)

    V1 = monomials(n,s);
    V2 = monomials(n,2*s);
    randvec = rand(n,1);  
    V2randvec = V2*randvec;   
    
    theta = -y;
    
    yy = exp(V2*log(xrand+1e-20))*theta;
    
    %create moment matrix
    MM = zeros(size(V1,1));
    smalltol = 0.1*min(diff(sort(V2randvec))); 
    for j = 1:size(V1,1)
       col = V1(j,:);
       for i = 1:j
          row = V1(i,:);
          val = (row+col)*randvec; 
          p = find(abs(V2randvec-val) < smalltol);
          MM(i,j) = yy(p);
       end
    end
    MM = MM+triu(MM,1)'; 
    MM = 0.5*(MM+MM');
    
    %eigenvalues
    eigMM = eig(full(MM));
    
    %validate
    smalltol = 1e-5*max(abs(eigMM));
    rankMM = length(find(eigMM > smalltol));
    mineig = min(eigMM);
    
    fprintf('\n rank of M(y) = %2.0f, mineigM = %3.2e\n\n',rankMM,mineig);