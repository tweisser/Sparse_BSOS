
%% Broyden Banded Function
problem = 'Rosenbrock';

%% Options

%%
id = [pwd,'/'];

for N = 100:100:600
    %% generate problem
    problemtag = [problem,num2str(N)];
    eval([problemtag,';']);
    pop = const_int01(pop,'SBSOS');
    pop = const_sumlt1(pop);
    save([id,'/pops/pop',problemtag],'pop');
    pop.k = full(ceil(max(sum(F(:,1:end-1),2)/2)));
        for d = 1:4
            pop.d=d;
            if d==2
                lss(pop,problemtag,'SPUT')
            end
            lss(pop,problemtag,'SBSOS')
        end
end

