% This function consists of objective function f and constraint
% functions gj, not necessarily convex;
% There are 9 constraints in the Minimization problem,
% P: min f ,s.t 0<= gj <= 1;
% The number of variabls is 4 and the highest degree is 8;

function [F,G,I,J,d,k] = test4_8

d=3;
k=4;

 F=[4 2 0 0 1;
    2 6 0 0 1;
    2 2 0 0 -1;
    0 0 4 2 1; 
    0 0 2 6 1; 
    0 0 2 2 -1];      %gF=x1^4*x2^2+x1^2*x2^6-x1^2*x2^2+x3^4*x4^2+x3^2*x4^6-x3^2*x4^2;
 
 g1=[2 0 0 0 1;
     0 2 0 0 1;
     0 0 2 0 1;
     0 0 0 2 1];      %gg1=x1^2+x2^2+x3^2+x4^2; 
 
 g2=[2 0 0 0 3;
     0 2 0 0 2;
     1 1 0 0 -4;
     0 0 2 0 3;
     0 0 0 2 2;
     0 0 1 1 -4];    %g2=3*x1^2+2*x2^2-4*x1*x2+3*x3^2+2*x4^2-4*x3*x4;
 
 g3=[0 0 0 0 2.5; 
     2 0 0 0 1;
     0 4 0 0 6;
     1 1 0 0 -8;
     0 0 2 0 1;
     0 0 0 4 6;
     0 0 1 1 -8];   %gg3=x1^2+6*x2^4-8*x1*x2+x3^2+6*x4^4-8*x3*x4+2.5;

 g4=[4 0 0 0 1;
     0 4 0 0 3;
     0 0 4 0 1;
     0 0 0 4 3];   %gg4=x1^4+3*x2^4+x3^4+3*x4^4;
 
 g5=[2 0 0 0 1;
     0 3 0 0 1;
     0 0 2 0 1;
     0 0 0 3 1];       %gg5=x1^2+x2^3+x3^2+x4^3; 
  
 g6=[1 0 0 0 1];
 g7=[0 1 0 0 1];
 g8=[0 0 1 0 1];
 g9=[0 0 0 1 1];
 
 G={g1;g2;g3;g4;g5;g6;g7;g8;g9};   
  
 I={[1 2 3 4]};
 J={[1 2 3 4 5 6 7 8 9]};



