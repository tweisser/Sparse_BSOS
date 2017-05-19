%********************************************************************
%% evalmon: evaluate monomials at a point x
%%
%% P(i,1:n) = powers of the i-th monomial
%%
%% This is a more stable way to evaluate Fx.
%%********************************************************************

function Px = evalmono(P,x)

   if (size(x,1) < size(x,2)); x = x'; end;
   n = length(x); 
    
   smtol = 1e-20;
   s = (1-sign(x))/2;
   sbar = rem(P*s,2);
   Px = exp(P*log(abs(x)+smtol));
   idx = find(sbar==1);
   Px(idx) = -Px(idx); 
%%********************************************************************