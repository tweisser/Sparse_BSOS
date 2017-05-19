%%*********************************************************
%% This code generates the Sparse Bounded Sums Of Squares
%% hierarchy for SDPT3 (internal use)
%% Use gendata2 to create your SDP.
%%*********************************************************
%% F: objective polynomial
%% G: a cell array containing the constraint polynomials
%% I: a cell array explaining sparsity in variables
%% J: a cell array explaining sparsity in constraints
%% dd: the degree of Lagrangian dual relaxation
%% kk: the degree of SOS relaxation
%%
%% This version is able to handle kk = 0 (i.e. [in abuse of notation] the LP case)
%% Author: Tillmann Weisser
%%*********************************************************


    function [bblk,AAt,CC,bb,constant,time,recy,degfg] = genSBSOSdata(F,G,I,J,dd,kk)

    time=cell(4,2);
    time{1,1} ='Init, analysis, writing';
    time{2,1} ='Compare coefficients (sparse representation)';
    time{3,1} ='generate Hab';
    time{4,1} ='Compare coefficients (certificates)';
    time{5,1} ='Remove dependent constraints and fixed variables';
    time{6,1} ='Total time';

    tic;

    %% OPTIONS

    RemoveConstant = true;
    RemoveDependent = false;
    RemoveFixvar = true;
    RecoverData = true;
    PrecCompCoef = false;

    %% Analyse problem data

    fprintf('\n This is SBSOS v2 \n')

    np1 = size(F,2);
    n = np1-1;                                % # variables total
    degf = max(sum(F(:,1:n),2));              % deg objective function
    m = length(G);                            % # constraints total
    if m
        gdeg = zeros(m,1);                    % # degree of each constraint
        for j=1:m
            gpower = G{j}(:,1:n);
            gdeg(j) = max(sum(gpower,2));
        end
    else
        gdeg = 0;
    end

    maxdeg = max([degf,dd*max(gdeg),2*kk]);  % maximal degree total
    degfg = max(degf,max(gdeg));
    degFl = maxdeg;

    p = length(I);                           % number of sparse blocks

    fprintf('\n n = %d, degf = %d, m = %d, d = %1.0f, k = %d, maxdeg = %d ',n,full(degf),m,dd,kk,full(maxdeg))

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
    fprintf('\n max_clique = %d max_cons = %d ',max(nI), max(mJ))

    sDim = zeros(p,1);        % size psd matrix for each block
    svDim = zeros(p,1);       % size of psd matrix represented in svec format
    HABcell = cell(p,1);       % all h(alpha,beta) for each block
    lDim = zeros(p,1);         % # (alpha,beta) in each block
    flMons = [];              % list of monomials for sparse representation
    fDim = zeros(p,1);        % number of monomials in sparse representation in each block
    tDim = 1;

    time{1,2} = toc;
    tic
    fprintf('\n Generating Hab polynomials for %d certificates ',p)
    for j=1:p
        sDim(j) = nchoosek(nI(j) + kk, nI(j));
        svDim(j) = sDim(j)*(sDim(j)+1)/2;
        if m
            GG = cell(mJ(j),1);                % constraints active in this block
            for i=1:mJ(j)
                GG{i} = G{J{j}(i)};
            end
            [HABcell{j},lDim(j)] = hpols(GG,dd);
        end
        newmons = SparseMons(n,degFl,I{j});
        flMons = [flMons; newmons]; %#ok
        fDim(j) = size(newmons,1);
    end

    time{3,2} = toc;
    tic

    fdim = sum(fDim);         % total number of sparse representation monomials
    ldim = sum(lDim);         % number of lagrange multipliers
    sdim = sum(sDim);         % size psd blk
    svdim = sum(svDim);
    if ~kk
        sdim = 0;
        svdim = 0;
    end
    tdim = 1;                 % number of optimizing variables

    nvar = svdim + ldim + tdim + fdim; % total number of variables

    %% Generate Variables for sBSOS and Contributution to the optimization criterion

    ct = 2;
    if kk; ct = ct+1; end
    if m; ct = ct+1; end

    blk = cell(ct,2);
    C = cell(ct,1);
    At=cell(ct,1);

    At=cell(3,1);

    ct = 1;
    if kk
        blk{ct,1} = 's';              % psd variables
        blk{ct,2} = sDim;
        C{ct,1} = zeros(sdim);        % do not contribute to the optimization criterion
        ct = ct+1;
    end
    if m
        blk{ct,1} = 'l';          % lagrange multipliers
        blk{ct,2} = ldim;
        C{ct,1} = zeros(ldim,1);  % do not contribute to the optimization criterion
        ct = ct+1;
    end

    blk{ct,1} = 'u';              % optimization variables
    blk{ct,2} = 1;
    C{ct,1} = -1;                 % opitmization criterion is max t

    ct = ct+1;
    blk{ct,1} = 'u';              % variables for sparse representation
    blk{ct,2} = fdim;
    C{ct,1} = zeros(fdim,1);      % do not contribute to the optimization criterion

    time{1,2} = time{1,2}+ toc;
    tic

    %% Generate Coefficients for Constraints

    %% Sparsity
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

    %% Handelmann

    fprintf('\n Comparing coefficients for %d certificates ... ',p)
    sinit = 0;
    linit = svdim;
    finit = svdim + ldim + tdim;
    flinit = 0;
    certAt = [];
    for i= 1:p
%         fprintf('\n consider certificate %d out of %d \n ',i,p)
%         laptime = clock;
        ii = []; jj = []; vv = [];
        if m
            ind =cell2mat(cellfun(@size,HABcell{i},'uni',0));
            ind = ind(:,1);
            nhexp = sum(ind);
        else
            nhexp = 0;
        end

        if kk
            [sexp, scof] = sospol(I{i},n,kk);
            ii = [ii, 1:svDim(i)];
            jj = [jj, sinit+[1:svDim(i)]];
            vv = [vv, -scof(1:svDim(i))'];
            mct = svDim(i);
        else
            mct = 0;
        end
        if m
            tmp = cell2mat(HABcell{i});
            habexp = tmp(:,1:n);
            habcof = tmp(:,np1);
            cct = 0;
            for j = 1:lDim(i)
                ii= [ii, [1:ind(j)]+mct];
                jj = [jj, ones(1,ind(j))*(j+linit)];
                vv= [vv, -habcof([1:ind(j)]+cct)'];
                mct = mct +ind(j);
                cct = cct+ind(j);
            end
        end
        
        fexp = flMons(flinit+1:flinit+fDim(i),:);
        flinit = flinit+fDim(i);

        ii = [ii, mct+[1:fDim(i)]];
        jj = [jj, finit+[1:fDim(i)]];
        vv = [vv, ones(1,fDim(i))];
        var = sparse(ii,jj,vv,svDim(i) + nhexp + tDim +fDim(i),nvar);

        if m&&kk
            exponents = [sexp;habexp;fexp];
        elseif m
            exponents = [habexp;fexp];
        elseif kk
            exponents = [sexp;fexp];
        else
            exponents = fexp;
        end


        at = compCoef(exponents,var,PrecCompCoef);
        certAt = [certAt; at];

        sinit = sinit + svDim(i);
        linit = linit + lDim(i);
        finit = finit + fDim(i);
%         fprintf('\n It took %f seconds to compare this certificate \n',etime(clock,laptime))
    end

    certb = zeros(size(certAt,1),1);
    time{4,2} = toc;
    tic

    %% Write constraints

    certAt = certAt';
    sparsityAt = sparsityAt';
    nspcons = size(sparsityAt,2);
    sparsityAt = [sparse(svdim,nspcons);sparse(ldim,nspcons);sparsityAt];

    nspcons = nspcons - 1;

    allAt = [certAt,sparsityAt];
    b = [certb;sparsityb];

    ct = 1;
    if kk
        At{ct} = allAt(1:svdim,:);
        allAt(1:svdim,:) = [];
        ct=ct+1;
    end
    if m
        At{ct} = allAt(1:ldim,:);
        allAt(1:ldim,:) = [];
        ct = ct+1;
    end

    At{ct} = allAt(1:tdim,:);
    allAt(1:tdim,:) = [];
    At{ct+1} = allAt;


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

    % remove fixed variables

    if RemoveFixvar
        [blk1,At1,C1,b1,R,scols,m] = removefixvar(blk,At,C,b,nspcons,RecoverData);
        recy.R = R; recy.scols = scols; recy.m = m;
    else
        blk1 = blk;
        At1 = At;
        C1 = C;
        b1 = b;
    end

    % remove dependent constraints
    if RemoveDependent
        y0 = zeros(length(b1),1);
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

    time{5,2} = toc;

    %%
    time{6,2} = time{1,2} +time{2,2} + time{3,2} + time{4,2} + time{5,2};
    %     time
    %*************************************************************************%
    end
