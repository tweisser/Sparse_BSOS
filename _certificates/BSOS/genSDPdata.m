%%********************************************************************
%% genSDPdata: generates the SDP corresponding to the BSOS hierarchy
%%
%% F: objective polynomial
%% G: a cell array containing the constraint polynomails
%% dd: the degree of Lagrangian dual relaxation
%% kk: the degree of SOS relaxation
%%
%% rmdepFLAG: internal use only
%% gridOn: internal use only
%%
%% Author: Kim-Chuan Toh, Tillmann Weisser
%%********************************************************************

function [blknew,Atnew,C,bnew,xrandall,maxdeg] = genSDPdata(F,G,dd,kk,rmdepFLAG,gridOn)

  if (nargin < 5); 
      rmdepFLAG = 1; 
      gridOn = 0;
  end

  rng('default');
  
  np1 = size(F,2); 
  n = np1-1;
  fdeg = max(sum(F(:,1:n),2));
  mm = length(G); 
  gdeg = zeros(mm,1);
  for j=1:mm
     gpower = G{j}(:,1:n);
     gdeg(j) = max(sum(gpower,2));
  end
%  fprintf('\n fdeg = %2.0f, maxgdeg = %2.0f, 2k = %2.0f',...
%      fdeg,max(gdeg),2*kk);
  fprintf('\n d = %2.0f, k = %2.0f',dd,kk);  
  maxdeg = max([fdeg,dd*max(gdeg),2*kk]);
  Lorg = nchoosek(n+maxdeg,n); %% # of points for evaluation
  maxL = max(nchoosek(n+maxdeg,2),5000);
  L = min(Lorg,maxL);    
  fprintf('\n explicitly limit the number of points to evaluate to %2.0f',maxL);
  fprintf('\n Lorg = %2.0f,number of points used = %2.0f',Lorg,L);
%%
  glist = monomials(2*mm,dd);
  J = size(glist,1); % # of monomials for 2*mm variables up to degree dd
  sdim = nchoosek(n+kk,n);
  
%% The block for PSD matrices, X is a sdim by sdim PSD Matrix
  blk{1,1}='s'; blk{1,2}=sdim;
  C{1,1}=sparse(sdim,sdim);

%% The block for nonnegative lambda vector, [lambda(1),...,lambda(J)]
  blk{2,1}='l'; blk{2,2}=J;
  C{2,1}=zeros(J,1);
  
%% The block for unrestriced varible t,  the object function is Min -t 
  blk{3,1}='u'; blk{3,2}=1;
  C{3,1}=-1;
%%
  vlist = monomials(n,kk); 
  V = zeros(sdim,L);
  H = zeros(J,L);
  b = zeros(L,1);
  normg = zeros(1,L);
  options = 1; 
  if (options==2) %% use Sobol or Halton points
     pp = haltonset(n,'skip',1000,'leap',10);
     pp = sobolset(n); %% better
     xlist = net(pp,L); 
  end
  if (gridOn)
      xrandall = mofngrid(n,maxdeg,'cheb');
  else
      xrandall = zeros(n,L); 
  end 
  for j=1:L
      if (gridOn)
          x = xrandall(:,j);
      else
          if (options==1) %% random points in [-1,1]^n.
              x = 1*(2*rand(n,1)-1); %% 1 is better
          elseif (options==2)
              x = 2*xlist(j,:)'-1;
          end
          xrandall(:,j) = x;
      end
      V(:,j) = evalmono(vlist,x);
      gx = zeros(mm,1);
      for k=1:mm
          gx(k) = evalpoly(G{k},x);
      end
      normg(j) = max(abs(gx));
      gx2 = [gx; 1-gx];
      H(:,j) = evalmono(glist,gx2);
      b(j) = evalpoly(F,x);
  end
%%
   len = size(H,1); normH = sqrt(sum(H'.*H')'); 
   H = spdiags(1./sqrt(normH),0,len,len)*H;  
   blk{1,3}=ones(1,L);
   At{1,1} = []; At{1,2}=V; At{1,3}=ones(L,1);
   At{2,1} = H; 
   At{3,1} = ones(1,L);    
%%
%% remove dependent constraints
%%
   if (rmdepFLAG)
      fprintf('\n removing dependent constraints ...'); 
      [blknew,Atnew,bnew,idx] = rmdepconstraint(blk,At,b);  
      xrandall = xrandall(:,idx);
   else
      blknew = blk; Atnew = At; bnew = b;
   end
%%********************************************************************
