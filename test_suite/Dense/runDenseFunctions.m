clear all;
%% Dense examples

%% Options
runB  = true;
BSOSsolver = 'sqlp';

runS = true;
SBSOSsolver = 'sqlp';

%% Examples

EX{1} = 'test4_2';
EX{2} = 'test4_4';
EX{3} = 'test4_6';
EX{4} = 'test4_8';

EX{5} = 'test6_2';
EX{6} = 'test6_4';
EX{7} = 'test6_6';

EX{8} = 'test8_2';
EX{9} = 'test8_4';

EX{10} = 'test10_2';
EX{11} = 'test10_4';

EX{12} = 'test20_2';

kk = [1 2 3 4 1 2 3 1 2 1 2 1];
dd = [1 2 3 3 1 3 3 1 2 1 2 1];

%% Go

for eg = [1:12]
    tag = EX{eg};
    eval(['[pop.F,pop.G,pop.I,pop.J] = ',tag,';']);
    k = kk(eg);
    pop.n = size(pop.F,2)-1;
    for d = 1:dd(eg)
        %% BSOS
        if runB
            algo = 'BSOS';
            solver = eval([algo,'solver',';']);
            pop.d = d; pop.k = k;
            lss(pop,tag,algo,solver)
            clear sdp sol psol;
        end
        
        %% SBSOS
        if runS
            algo = 'SBSOS';
            solver = eval([algo,'solver',';']);
            pop.d = d; pop.k = k;
            lss(pop,tag,algo,solver)
            clear sdp sol psol;
        end
    end
end


