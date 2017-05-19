function pop = const_sumlt1(pop,certtag)

    if ~isfield(pop,'I')
        error('Sparsity pattern I is unknown')
    end
    
    if isfield(pop,'G')
        G = pop.G;
        if isfield(pop,'J')
            J = pop.J;
        else
            error('Structure of G is unknown')
        end
    else
        G = {};
        J = cell(size(pop.I));
    end
    
    I = pop.I;
    p = max(size(pop.I));
    n = max(cell2mat(pop.I));
    np1 = n +1;
    gct = length(G);
  
     
    for l = 1:p
        lil = length(pop.I{l});
        G = [G, {sparse([1:lil,1:lil,lil+1],[pop.I{l},ones(1,lil+1)*np1],[ones(1,lil)*2,ones(1,lil)*(-1),1])}];
        J{l} = [J{l}, gct+l];
    end
    

    pop.G = G;
    pop.J = J;

    