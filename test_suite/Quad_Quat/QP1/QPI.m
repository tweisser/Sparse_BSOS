% This script executes the commands use to run the examples in Table

ex = 'QPI';
certtags={'BSOS','SBSOS'};

% Second relaxation with k=1.
k=1; d=1;

% Different patterns considered in the
OO = [40 30 20 10 5 1];


%%
% don't change anything below this line

id = [pwd,'/'];
for oo = OO
    fname = ['QPI_',num2str(oo)];
    for i = 1:2
        cert = certtags{i};
        name = [fname,'_',cert];
        if strcmp(cert,'BSOS')
            if expop(name)
                load([id,'pops/pop',name])
            else
                %load testfunction and generate pop
                load([id,'functions/',fname],'pop')
                
                pop = const_sumlt1(pop,cert);
                pop = const_int01(pop,cert);
                
                save([id,'pops/pop',name],'pop')
            end
            pop.d = d;
            pop.k = k;
            lss(pop,name,cert);
            clear pop;
        elseif strcmp(cert,'SBSOS')
            for j = 1:11          
                if expop(name)
                    load([id,'pops/pop',name])
                else
                    %load testfunction and generate pop
                    load([id,'functions/',fname],'pop')

                    pop = const_int01(pop,cert);
                    pop = const_sumlt1(pop,cert);
                    save([id,'pops/pop',name],'pop')
                end
                pop.d = d;
                pop.k = k;
                lss(pop,name,cert);
                clear pop;
            end
        elseif strcmo(cert,'SPUT')
            display('Putinar not considered')
        end
    end
end