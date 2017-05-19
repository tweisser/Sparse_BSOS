% table
% This script executes the commands used to run the examples in Table
ex = 'QPII';
certtags={'BSOS','SBSOS'};

% Second relaxation with k=1.
k=1; d=2;

% Different patterns considered in the

pname = {'90' '50+42' '50+26+18' '50+2x18+10' '50+5x10' '2x34+26' '3x26+18',...
    '34+3x18+10', '2x26+2x18+10', '5x18+10' '11x10'};

% name of the function to be considered and placed in pwd/functions
fname = 'QPII_90_11x10_2';

%%
% don't change anything below this line
fprintf('pat \t n-var \t f-var \t const \t rnk \t time\n')
id = [pwd,'/'];
for i = 1:2
    cert = certtags{i};
    name = [fname,'_',cert];
    if strcmp(cert,'BSOS')
        name = ['QPII_',pname{1}];
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
            fprintf('%s \t %d\t %d\t %d %1.2f \t %5.1f \t %6.5f \t %s \n',...
                pname{1},sdp.blk{2,2},sdp.blk{3,2},length(sdp.b),psol.rnk,psol.ttot,psol.obj,[sol.info.msg1,sol.info.msg2,sol.info.msg3])
        end
    elseif strcmp(cert,'SBSOS')
        for j = 1:11
            name = ['QPII_',pname{j}];
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
            fprintf('%s \t %d\t %d\t %d %1.2f \t %5.1f \t \t %6.5f %s \n',...
                pname{j},sdp.blk{2,2},sdp.blk{4,2}+1,length(sdp.b),psol.rnk,psol.ttot,psol.obj,[sol.info.msg1,sol.info.msg2,sol.info.msg3])
            else
                fprintf('%s\n',pname{j})
            end
            
        end
        
    end
end

