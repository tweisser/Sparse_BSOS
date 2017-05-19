function I = n_pattern(n,cls,ov)
% returns a sprsity pattern with n variables in blocks of size at most cls
% overlapping by ov
 
I = {};
ct2 = ov;
while ct2 <n 
    ct1 = ct2-ov+1;
    ct2 = min(ct1 + cls-1,n);
    I = [I ,{ct1:ct2}];
 end