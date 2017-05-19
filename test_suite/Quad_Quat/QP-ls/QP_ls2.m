% This script executes the commands use to run the examples in Table
ex = 'QP_ls';
certtags={'SBSOS','SPUT'};
k=1;
id = [pwd,'/'];
for p=100:300:1000
    for cl = [4 5]
        for c =1
            cert = certtags{c};
            for d = 2
                if ~((strcmp(cert,'BSOS')&&((d>2)||(n>40)))||(strcmp(cert,'SPUT')&&((d==1)||((cl>10)||n==120)))||(strcmp(cert,'SBSOS')&&(d==3)&&(cl>10)))
                    
                    fname = [ex,'_',num2str(p),'x',num2str(cl),'_',num2str(cl-3)];
                    name = [fname,cert]
                    relname = [name,'_',cert,'_d',num2str(d)];
                    b = exprobdata(name,relname)
                    
                    if b(1)
                        load([id,'pops/pop',name])
                    else
                        %load testfunction and generate pop
                        load([id,'functions/',fname],'pop')
                        pop = const_int01(pop,cert);
                        pop = const_linlt1(pop,cert);
                        save([id,'pops/pop',name],'pop')
                    end
                    pop.d = d;
                    pop.k = k;
                    
                    if b(1)&&b(2)
                        load([id,'sdps/sdp',relname])
                    else
                        %generate sdp
                        sdp = gendata2(pop,cert)
                        save([id,'sdps/sdp',relname], 'sdp')
                    end
                    
                    % solve problem
                    if b(1)&&b(2)&&b(3)
                        load([id,'sols/sol',relname])
                    else
                        sol = csol(sdp,'sqlp');
                        save([id,'sols/sol',relname], 'sol')
                    end
                    
                    % postprocessing
                    if b(1)&&b(2)&&b(3)&&b(4)
                        load([id,'psols/psol',relname])
                    else
                        psol = postproc(pop,sdp,sol)
                        save([id,'psols/psol',relname], 'psol')
                    end
                end
            end
        end
    end
end


