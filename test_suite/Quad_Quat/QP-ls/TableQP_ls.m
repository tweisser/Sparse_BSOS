% table
% This script executes the commands use to run the examples in Table
ex = 'QP_ls';
certtags={'BSOS','SBSOS','SPUT'};
k=1;
id = [pwd,'/'];
jct = 0;
tt = zeros(4,4);
ts = zeros(4,4);
tg = zeros(4,4);
nn = zeros(4,4);
ng = zeros(4,4);
ict = 0;

fprintf('pat \t cl \t n \t nnvar \t fvar \t constr \t remconst \t rnk \t time \n')
for cl = [4 5]
    ict = ict+1;
    jct=0;
    for p=100:300:1000
        jct = jct+1;
        for c =2
            cert = certtags{c};
            for d = 2
                
                fname = [ex,'_',num2str(p),'x',num2str(cl),'_',num2str(cl-3)];
                name = [fname,cert];
                relname = [name,'_',cert,'_d',num2str(d)];
                b = exprobdata(name,relname);
                
                if b(1)&&b(2)&&b(3)&&b(4)
                    load([id,'sdps/sdp',relname])
                    load([id,'sols/sol',relname])
                    load([id,'psols/psol',relname])
                    fprintf(' %4.0f \t %d,\t %4.0f \t  %6.0f \t  %5.0f \t  %6.0f \t  %6.0f \t %1.2f \t %5.1fs \t %s\n',p,cl,sdp.n,sdp.blk{2,2},sdp.blk{4,2}+1,length(sdp.b),length(sdp.recy.At{3}),psol.rnk,psol.ttot,[sol.info.msg1,sol.info.msg2,sol.info.msg3])
                    nn(ict,jct) = sdp.n;
                    tt(ict,jct) = psol.ttot;
                    tg(ict,jct) = sdp.tGEN;
                    ts(ict,jct) = sol.tSOL;
                    pp(ict,jct) = p;
                    ng(ict,jct) = sdp.blk{2,2};
                end
            end
        end
    end
end

for cl = [8 9]
    ict = ict+1;
    jct=0;
    for p=50:150:500
        
        
        jct = jct +1;
        for c =2
            cert = certtags{c};
            for d = 2
                
                fname = [ex,'_',num2str(p),'x',num2str(cl),'_',num2str(cl-6)];
                name = [fname,cert];
                relname = [name,'_',cert,'_d',num2str(d)];
                b = exprobdata(name,relname);
                
                if b(1)&&b(2)&&b(3)&&b(4)
                    load([id,'sdps/sdp',relname])
                    load([id,'sols/sol',relname])
                    load([id,'psols/psol',relname])
                    fprintf(' %4.0f \t %d\t %4.0f \t  %6.0f \t  %5.0f \t  %6.0f \t  %6.0f \t %1.2f \t %5.1fs \t %s\n',p,cl,sdp.n,sdp.blk{2,2},sdp.blk{4,2}+1,length(sdp.b),length(sdp.recy.At{3}),psol.rnk,psol.ttot,[sol.info.msg1,sol.info.msg2,sol.info.msg3])
                    nn(ict,jct) = sdp.n;
                    pp(ict,jct) = p;
                    tt(ict,jct) = psol.ttot;
                    tg(ict,jct) = sdp.tGEN;
                    ts(ict,jct) = sol.tSOL;
                    ng(ict,jct) = sdp.blk{2,2};
                 end
            end
        end
    end
end


