%%*********************************************************
%% This code generates the Sparse Lasserre hierarchy for SDPT3
%%*********************************************************
%% F: objective polynomial
%% G: a cell array containing the constraint polynomials
%% I: a cell array explaining sparsity in variables
%% J: a cell array explaining sparsity in constraints
%% d: the degree of the relaxation
%%
%% Author: Tillmann Weisser
%%*********************************************************


    function [bblk,AAt,CC,bb,constant,time,recy,degfg] = genSPUTdata(F,G,I,J,d)
    
    time=cell(5,2);
    time{1,1} ='Init, analysis, writing';
    time{2,1} ='Compare coefficients (sparse representation)';
    time{3,1} ='Compare coefficients (certificates)';
    time{4,1} ='Remove dependent constraints and fixed variables';
    time{5,1} ='Total time';

    tic;

    %% OPTIONS
    
    RemoveConstant = true;
    RemoveDependent = true;
    RemoveFixvar = true;
    RecoverData = true;
    RemoveSinglePSD = true;

    %% Analyse problem data
    
    fprintf('\n This is SPUT \n')
    
    np1 = size(F,2);
    n = np1-1;                                % # variables total
    degf = max(sum(F(:,1:n),2));              % deg objective function
 
    m = length(G);                            % # constraints total
    if m
        gdeg = zeros(m,1);                    % # degree of each constraint
        for j=1:m
            gdeg(j) = max(sum(G{j}(:,1:n),2));
        end
    else
        gdeg = 0;
    end

    p = length(I);        % number of sparse blocks
    sdeg = cell(1,p);
    degFl = zeros(p,1);
    
    if nargin < 5
        d = floor((degf+1)/2);
    end
    
    for l = 1:p
         sdeg{l} = [d,floor((2*d-gdeg(J{l}))./2)'];
         degFl(l)= 2*max(sdeg{l});
    end
    
    if degf > max(degFl)
        error(' Relaxation low: Increase relaxation order d!');
    end
    degfg = max(degf,max(gdeg));
    
    fprintf('\n n = %d, degf = %d, m = %d, relaxation order = %d',n,full(degf),m,d)

    %% Remove constant term before generating problem

    constant = 0;

    if (RemoveConstant)
        indConstants = find(ismember(F(:,1:n),zeros(1,n),'rows'));
        if sum(indConstants) > 0
            constant = sum(F(indConstants,np1));
            F(indConstants,:) = [];
        end
    end


    %% Preparing constraint generation
    
    nI = cellfun('length',I);          % # variables in each block
    mJ = cellfun('length',J);          % # constraints in each block
    fprintf('\n max_clique = %d ',max(nI))
       
    sDim  = cell(1,p);       % size of psd matrices
    svDim = cell(p,1);       % size of psd matrices represented in svec format
    flMons = [];             % list of monomials for sparse representation
    fDim = zeros(p,1);       % number of monomials in sparse representation in each block
    %tDim = 1;
    
     
    for l=1:p
        sDim{l} = factorial(nI(l)+sdeg{l}) ./ (factorial(sdeg{l}) .* factorial(nI(l)));
        svDim{l} = sDim{l}.*(sDim{l}+1)./2;
        newmons = SparseMons(n,degFl(l),I{l});
        fDim(l) = size(newmons,1);
        flMons = [flMons; newmons]; %#ok
    end

    
     fdim = sum(fDim);                  % total number of sparse representation monomials
     sdim = sum(cellfun(@sum,sDim));    % size psd blk
     svdim = sum(cellfun(@sum,svDim));
     tdim = 1;                          % number of optimizing variables
 
     nvar = svdim + tdim + fdim;        % total number of variables
 
    
%% Generate Variables for sBSOS and Contributution to the optimization criterion
 

     blk = {'s',cell2mat(sDim);'u',1;'u',fdim};
     C = {zeros(sdim);-1;zeros(fdim,1)};
 
    time{1,2} = toc;
    tic
 
%% Generate Coefficients for Constraints
 
% Sparsity
    fprintf('\n Comparing coefficients of representing polynomials ...  ')
    Fexp = F(:,1:n);
    Fcof = F(:,np1);
    Flcof = ones(fdim,1);
    var = [spdiags([1;Flcof],0,fdim+1,fdim+2); sparse(size(F,1),fdim+1),Fcof];
    
    tmp = compCoef([sparse(1,n);flMons;Fexp],var);
    sparsityb = tmp(:,fdim+2);
    sparsityAt = tmp(:,1:fdim+1);
        
    time{2,2} = toc;
    tic
 
% Putinar
    fprintf('\n Comparing coefficients for %d certificates ... ',p)
    sinit = 0;
    finit = svdim + tdim;
    flinit = 0;
    certAt = [];
    for l= 1:p
      
         [pexp,ii,jj,vv] = putsum([],[],[],[],I{l},n,sdeg{l}(1));
 
         for j= 1:mJ(l)
            [pexp,ii,jj,vv] = putsum(pexp,ii,jj,vv,I{l},n,sdeg{l}(j+1),G{J{l}(j)});
         end
        mct = ii(end);
        fexp = flMons(flinit+1:flinit+fDim(l),:);
        ii = [ii, mct+1:mct+fDim(l)]; jj = [jj+sinit,finit+1:finit+fDim(l)]; vv = [vv,ones(1,fDim(l))]; %#ok

        var = sparse(ii,jj,vv,max(ii),nvar);        
        at = compCoef([pexp;fexp],var);
 
        certAt = [certAt; at];%#ok
         
        flinit = flinit+fDim(l);
        sinit = sinit + sum(svDim{l});
        finit = finit + fDim(l);
    end

    certb = zeros(size(certAt,1),1);
    time{3,2} = toc;
    tic
 
%% Write constraints
     
    nspcons = size(sparsityAt,1);
    sparsityAt = [sparse(svdim,nspcons);sparsityAt'];
    
    nspcons = nspcons - 1;
    
    allAt = [certAt',sparsityAt];  
    b = [certb;sparsityb];        
    
    At=cell(3,1);
    At{1} = allAt(1:svdim,:);
    allAt(1:svdim,:) = [];
    At{2} = allAt(1:tdim,:);
    allAt(1:tdim,:) = [];
    At{3} = allAt;


    time{1,2} = time{1,2} + toc;  
    tic

    %% optimize SDP fo sdpt3
    fprintf('\n Optimize SDP for solver ... ')
    recy.I = I;
    recy.At = At;
    recy.degFl = degFl;
    recy.nspcons = nspcons;
    recy.RemoveFixvar = RemoveFixvar;
    recy.RemoveDependent = RemoveDependent;
     
%% remove 1x1 psd variables
    
    if RemoveSinglePSD
        [blk,At,C,b] = elimPSDvars( blk,At,C,b );
    end
    
%% remove fixed variables
 
    if RemoveFixvar
        [blk1,At1,C1,b1,R,scols,m] = removefixvar(blk,At,C,b,nspcons,RecoverData);
        recy.R = R; recy.scols = scols; recy.m = m; 
    else
        blk1 = blk; %#ok
        At1 = At;
        C1 = C;
        b1 = b;
    end
        
%% remove dependent constraints    

    if RemoveDependent
        y0 = zeros(length(b1),1); %#ok
        [AAt,bb,y0,idxB,neardepconstr,feasible] =  checkdepconstr(blk1,At1,b1,y0,1);
        fprintf('\n Removed %2.0f nearly dependent constraints \n',neardepconstr)
        CC = C1;
        bblk = blk1;
        recy.y0 = y0; recy.idxB = idxB;
    else
        bblk = blk1;
        AAt = At1;
        CC = C1;
        bb = b1;
    end

    time{4,2} = toc;
     
%% 
    time{5,2} = time{1,2} +time{2,2} + time{3,2} + time{4,2};
    
    %*************************************************************************%
    end
