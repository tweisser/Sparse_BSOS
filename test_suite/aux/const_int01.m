function pop = const_int01(pop,certtag)
    % adds constraint polynomils x_i

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
        pop.J=J;
    end
    
    I = pop.I;
    
    p = max(size(I));
    n = max(cell2mat(I));
    np1 = n +1;
    
    if strcmp(certtag,'BSOS')
    	I = {1:n}; 
        J = {1:length(G)};
        p = 1;
    end

    gct = length(G)+1;

    for l = 1:p
        for i = I{l}
            g1 = sparse([1 1],[i np1],[1 1]);
            G = [G,{g1}];
            J{l} = [J{l}, gct];
            gct = gct+1;
        end
    end
    

    pop.G = G;
    pop.J = J;
    
end
