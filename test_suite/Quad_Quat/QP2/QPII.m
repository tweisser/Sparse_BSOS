% This script executes the commands use to run the examples in Table

ex = 'QPII';
certtags={'BSOS','SBSOS'};

% Second relaxation with k=1.
k=1; d=2;   


%%
% don't change anything below this line

%load testfunction and generate pop
% name of the function to be considered and placed in pwd/functions

fname = 'QPII_90_11x10_2';
id = [pwd,'/'];
load([id,'functions/',fname],'pop')

I = pattern(ones(1,11)*10,2);
p = length(I);
pop = const_linlt1(pop);
J = pop.J;

EX = {{unique([I{1:p}])},{[J{1:p}]},'90';...
    {unique([I{1:6}]),unique([I{7:p}])},{[J{1:6}],[J{7:p}]},'50+42';...
    {unique([I{1:6}]),unique([I{7:9}]),unique([I{10:11}])},{[J{1:6}],[J{7:9}],[J{10:11}]},'50+26+18';...
    {unique([I{1:6}]),unique([I{7:8}]),unique([I{9:10}]),I{11}},{[J{1:6}],[J{7:8}],[J{9:10}],J{11}},'50+2x18+10';...
    {unique([I{1:6}]),I{7},I{8},I{9},I{10},I{11}},{[J{1:6}],J{7},J{8},J{9},J{10},J{11}},'50+5x10';...
    {unique([I{1:4}]),unique([I{5:8}]),unique([I{9:p}])},{[J{1:4}],[J{5:8}],[J{9:p}]},'2x34+26';...
    {unique([I{1:3}]),unique([I{4:6}]),unique([I{7:9}]),unique([I{10:p}])},{[J{1:3}],[J{4:6}],[J{7:9}],[J{10:p}]},'3x26+18';...
    {unique([I{1:4}]),unique([I{5:6}]),unique([I{7:8}]),unique([I{9:10}]),I{11}},{[J{1:4}],[J{5:6}],[J{7:8}],[J{9:10}],J{11}},'34+3x18+10';...
    {unique([I{1:3}]),unique([I{4:6}]),unique([I{7:8}]),unique([I{9:10}]),I{11}},{[J{1:3}],[J{4:6}],[J{7:8}],[J{9:10}],J{11}},'2x26+2x18+10';...
    {unique([I{1:2}]),unique([I{3:4}]),unique([I{5:6}]),unique([I{7:8}]),unique([I{9:10}]),unique([I{11:p}])},{[J{1:2}],[J{3:4}],[J{5:6}],[J{7:8}],[J{9:10}],[J{11:p}]},'5x18+10';...
    I,J,'11x10'};


for i = 1:2
    cert = certtags{i};
    name = [fname,'_',cert];
    if strcmp(cert,'BSOS')
            if expop(['QPII_',EX{1,3}])
                load([id,'pops/pop','QPII_',EX{1,3}])
            else
                pop.I = EX{1,1};
                pop.J = EX{1,2};
                pop1 = const_int01(pop,cert);
                save([id,'pops/pop','QPII_',EX{1,3}],'pop1')
            end
            pop1.d = d; pop1.k = k;
            lss(pop1,['QPII_',EX{1,3}],cert);
            clear pop1;
    elseif strcmp(cert,'SBSOS')
        for j = 1:11
                if expop(['QPII_',EX{j,3}])
                load([id,'pops/pop','QPII_',EX{j,3}])
                else
                    pop.I = EX{j,1};
                    pop.J = EX{j,2};
                    pop1 = const_int01(pop,cert);
                    save([id,'pops/pop','QPII_',EX{j,3}],'pop1')
                end
            pop1.d = d; pop1.k = k;
            lss(pop1,['QPII_',EX{j,3}],cert);
            clear pop1;
        end 
    end
end