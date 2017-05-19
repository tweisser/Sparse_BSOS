function x = mom2x(YY,pop)

x = zeros(pop.n,1);

nlp1 = cellfun(@length,pop.I)+1;

for l = 1:length(pop.I)
    x(pop.I{l}) = YY{l}(2:nlp1(l));
end
end
