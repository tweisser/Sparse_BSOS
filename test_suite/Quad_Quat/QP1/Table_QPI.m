% table
% This script executes the commands used to run the examples in Table

ex = 'QPI';
certtags={'BSOS','SBSOS'};

% First relaxation with k=1.
k=1; d=1;

% Different patterns considered in the
OO = [40 30 20 10 5 1];



%%
% don't change anything below this line
fprintf('o \t n \t n-var \t f-var \t const \t rnk \t sol \t time\n')
id = [pwd,'/'];
for oo = OO
    fname = ['QPI_',num2str(oo)];
    for i = 1:2
        cert = certtags{i};
        name = [fname,'_',cert];
        if strcmp(cert,'BSOS')
            pop.d = d; pop.k = k;
            relname = [name,'_',cert,'_d',num2str(pop.d)];
            if isfield(pop,'k')
                relname = [relname,'_k',num2str(pop.k)];
            end
            b = exprobdata(name,relname);
            if b(1)&&b(2)&&b(3)&&b(4)
                load([id,'sdps/sdp',relname])
                load([id,'sols/sol',relname])
                load([id,'psols/psol',relname])
                fprintf('%d \t %d \t %d\t %d\t %d \t %1.2f \t%6.4e \t  %5.1fs \t %s \n',...
                    oo,sdp.n,sdp.blk{2,2},sdp.blk{3,2},length(sdp.b),psol.rnk,psol.obj,psol.ttot,[sol.info.msg1,sol.info.msg2,sol.info.msg3])
            end
        elseif strcmp(cert,'SBSOS')
             pop.d = d; pop.k = k;
            relname = [name,'_',cert,'_d',num2str(pop.d)];
            if isfield(pop,'k')
                relname = [relname,'_k',num2str(pop.k)];
            end
            b = exprobdata(name,relname);
            if b(1)&&b(2)&&b(3)&&b(4)
                load([id,'sdps/sdp',relname])
                load([id,'sols/sol',relname])
                load([id,'psols/psol',relname])
                fprintf('%d \t %d \t %d\t %d\t %d \t %1.2f \t%6.4e \t  %5.1fs \t %s \n',...
                oo,sdp.n,sdp.blk{2,2},sdp.blk{4,2}+1,length(sdp.b),psol.rnk,psol.obj,psol.ttot,[sol.info.msg1,sol.info.msg2,sol.info.msg3])
            end
        elseif strcmo(cert,'SPUT')
            display('Putinar not considered')
        end
    end
end
