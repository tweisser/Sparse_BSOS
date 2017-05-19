%%********************************************************************
%% monomials: generate all the powers of n-variable monomials 
%%            up to degree deg.
%% list(i,:) = powers of the i-th monomial.
%%
%% (n,deg) = (20,6), size(list) = [230230,20], 23.1% nnz.
%% (n,deg) = (50,4), size(list) = [316251,50], 7.4% nnz.
%%********************************************************************

    function list = monomials(n,deg)

    if (n==0); list = []; return; end
    if (n==1); list = [0:deg]'; return; end
    if (deg==0); list = zeros(1,n); return; end
    if (deg==1); list = [zeros(1,n); eye(n)]; return; end
    L = nchoosek(n+deg,deg);
    list = zeros(L,n);
    count=0;    
    for d=0:deg
        J = nchoosek(n-1+deg-d,deg-d);
        ee = ones(J,1); 
        list(count+[1:J],:) = [monomials(n-1,deg-d), d*ee];
        count = count+J;
    end
    dd = sum(list,2); 
    [~,idxsort] = sort(dd);
    list = list(idxsort,:);
%%********************************************************************