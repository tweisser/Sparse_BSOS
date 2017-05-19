%********************************************************************
%% evalmon: evaluate monomials at a point x
%%
%% P(i,1:n) = powers of the i-th monomial
%%
%% This is a more stable way to evaluate Fx.
%% 
%% Author: Kim-Chuan Toh
%%********************************************************************

function Px = evalmono_v_1_1(P,x)


   n = size(P,2);
   nx = size(x,1);
    
   if nx ~= n
       error('dimensions mismatch');
   end
    
   smtol = 1e-20;
   s = (1-sign(x))/2;
   sbar = rem(P*s,2);
   Px = exp(P*log(abs(x)+smtol));
   %Px(Px<1e-12)=0;
   idx = find(sbar==1);
   Px(idx) = -Px(idx); 
%%********************************************************************
