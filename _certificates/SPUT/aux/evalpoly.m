%********************************************************************
%% evalpoly: evaluate F(x) where F is in the following format:
%%
%% F(i,1:n) = powers of the i-th monomial
%% F(i,n+1) = coefficent
%%
%% This is a more stable way to evaluate Fx.
%%********************************************************************

    function Fx = evalpoly(F,x)

    if (size(x,1) < size(x,2)); x = x'; end

    smtol = 1e-20;
    [len,np1] = size(F);
    n = np1-1;
    s = (1-sign(x))/2;
    P = F(:,1:n); ff = F(:,n+1);
    sbar = rem(P*s,2);
    xx = exp(P*log(abs(x)+smtol));
    idx = find(sbar==1);
    if isempty(idx)
       Fx = ff'*xx; 
    else       
       Fx = ff'*xx-2*ff(idx)'*xx(idx);
    end
%%********************************************************************
