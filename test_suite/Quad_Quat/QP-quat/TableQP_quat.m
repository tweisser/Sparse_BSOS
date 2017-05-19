% table
% This script executes the commands use to run the examples in Table
ex = 'QP_quat';
certtags={'BSOS','SBSOS','SPUT'};
k=1;
id = [pwd,'/'];

for c =1:3
    for n= 40:40:120
        for cl = [10 20 40]
            if cl < n
                cert = certtags{c};
                for d = 1:3
                    
                    name = [ex,'_',num2str(n),'_',num2str(cl),'_',num2str(5),'_',cert];
                    relname = [name,'_',cert,'_d',num2str(d),'_k',num2str(k)];
                    b = exprobdata(name,relname);
                    
                    if b(1)&&b(2)&&b(3)&&b(4)
                        load([id,'sols/sol',relname])
                        load([id,'psols/psol',relname])
                        fprintf('%s \t n=%d \t cl=%d \t d=%d \t %6.4e \t %1.1f \t %3.1f\t %s \n',cert,n,cl,d,psol.obj,psol.rnk,psol.ttot,sol.info.msg2)
                    else
                        
                        fprintf('%s \t n=%d \t cl=%d \t d=%d \t %6.4e \t \t %1.1f \t %3.1f\t %s \n',cert,n,cl,d,NaN,NaN,NaN,'not solved')
                    end
                end
            end
        end
    end
    
end

