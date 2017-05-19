%********************************************************************
%% evalpoly: evaluate F(x) where F is in the following format:
%%
%% F(i,1:n) = powers of the i-th monomial
%% F(i,n+1) = coefficent
%%
%% This is a more stable way to evaluate Fx.
%%
%% Author: Kim-Chuan Toh
%%********************************************************************

    function Fx = evalpoly_v_1_1(F,x)

    np1 = size(F,2);
    n = np1-1;
    nx = size(x,1);
    
    if nx ~= n
        error('dimensions mismatch');
    end
    
    %parameter
    smtol = 1e-20;
        
    s = (1-sign(x))/2;
    P = F(:,1:n); 
    ff = F(:,np1);
    sbar = rem(P*s,2);
    xx = exp(P*log(abs(x)+smtol));
%     if xx<1e-16
%         xx=0;
%     end
    idx = find(sbar==1);
    if isempty(idx)
       Fx = ff'*xx; 
    else       
       Fx = ff'*xx-2*ff(idx)'*xx(idx);
    end
%%********************************************************************
