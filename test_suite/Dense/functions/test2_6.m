% This function consists of objective function f and constraint
% functions gj, not necessarily convex;
% There are 7 constraints in the Minimization problem,
% P: min f ,s.t 0<= gj <= 1;
% The number of variabls is 2 and the highest degree is 6;

function [F,G,I,J,gF,gK,d,k] = test2_6

n=2; 
d=2;
k=3;

 F=[4 2 1;
    2 4 1;
    2 2 -1];                        %f=x1^4*x2^2+x1^2*x2^4-x1^2*x2^2; 
 
 g1=[2 0 1;
     0 2 1];                        %g1=x1^2+x2^2;  
 
 g2=[2 0 3;
     0 2 2;
     1 1 -4];                       %g2=3*x1^2+2*x2^2-4*x1*x2;
 
 g3=[0 0 2.5;
     2 0 1;
     0 4 6;
     1 1 -8];                       %g3=x1^2+6*x2^4-8*x1*x2+2.5;
 
 g4=[4 0 1;
     0 4 3];                        %g4=x1^4+3*x2^4;
 
 g5=[2 0 1;
     0 3 1];                        %g5=x1^2+x2^3;
 
 g6=[1 0 1];                        %g6=x1;
 
 g7=[0 1 1];                        %g7=x2;
 
 G={g1;g2;g3;g4;g5;g6;g7};
 I={[1 2]};
 J={[1 2 3 4 5 6 7]};
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mpol x1 x2;

gF=x1^4*x2^2+x1^2*x2^4-x1^2*x2^2; 

gg1=x1^2+x2^2;
gg2=3*x1^2+2*x2^2-4*x1*x2;
gg3=x1^2+6*x2^4-8*x1*x2+2.5;
gg4=x1^4+3*x2^4;
gg5=x1^2+x2^3;
gg6=x1;
gg7=x2;
%%
gK=[gg1>=0,gg2>=0,gg3>=0,gg4>=0,gg5>=0,gg6>=0,gg7>=0,...
   gg1<=1,gg2<=1,gg3<=1,gg4<=1,gg5<=1,gg6<=1,gg7<=1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

