% This script executes the commands use to run the examples in Table
ex = 'QP_quat';
certtags={'BSOS','SBSOS','SPUT'};
k=1;
id = [pwd,'/'];
for n= 40:40:120
    for cl = [10 20 40]
        if cl < n
            for c =1:3
                cert = certtags{c};
                for d = 2:3
                   if ~((strcmp(cert,'BSOS')&&((d==3)||(n>40)))||(strcmp(cert,'SPUT')&&((cl>10)||(n==120)||d==3))||(strcmp(cert,'SBSOS')&&(d==3)&&(cl>10)))
                        
                        fname = [ex,'_',num2str(n),'_',num2str(cl),'_',num2str(5)];
                        name = [ex,'_',num2str(n),'_',num2str(cl),'_',num2str(5),'_',cert]
                        relname = [name,'_',cert,'_d',num2str(d)];
                        b = exprobdata(name,relname);
                        
                        if b(1)
                            load([id,'pops/pop',name])
                        else
                            %load testfunction and generate pop
                            load([id,'functions/',fname],'pop')
                            pop = const_int01(pop,cert);
                            pop = const_sq01(pop,cert);
                            save([id,'pops/pop',name],'pop')
                        end
                        pop.d = d;
                        pop.k = k;
                        
                        lss(pop,name,cert)
                   end
                end
            end
        end
    end
end

