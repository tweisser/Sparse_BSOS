%%****************************************************%%
% This function generates the moment matrix to a given %
% sequence (internal use)                              %
% Author: Tillmann Weisser, Kim-Chuan Toh
%%****************************************************%%    

function MM = momentmatrix(yy,n,degfg)

    if mod(degfg,2)
        %display('degfg needs to be even');
        degfg= degfg+1; 
    end
    
    
    V1 = monomials(n,degfg);
    s = nchoosek(n+degfg/2,degfg/2);
    
    randvec = rand(n,1);  
    V1randvec = V1*randvec;  
    
    %create moment matrix
    MM = zeros(s);
    smalltol = 0.1*min(diff(sort(V1randvec))); 
    for j = 1:s
       col = V1(j,:);
       for i = 1:j
          row = V1(i,:);
          val = (row+col)*randvec; 
          MM(i,j) = yy(abs(V1randvec-val) < smalltol);
       end
    end
    MM = MM+triu(MM,1)';
    MM = 0.5*(MM+MM');
end

