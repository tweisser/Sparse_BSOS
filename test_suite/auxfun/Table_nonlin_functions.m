function Table_nonlin_functions(problem,nn,dd,k)
% This function displays a table to give an overview over the results
% obtained by SBSOS and SPUT
% problem: 'ChainedWood', 'ChainedSingular', 'Rosenbrock'
%           'DiscreteBoundary', 'BroydenBanded'
% nn:       vector of number of variables that shall be displayed (e.g.
%           100:100:500 )
% dd:       vector of relaxations that shall be displayed (e.g. 1:3)
% k:        parameter for SBSOS 
%%%%%%%%%%%%%%%


certtags={'SBSOS','SPUT'};
id = [pwd,'/'];
fprintf('n \t rel \t sol \t rk \t time \t msg  \n')
for c =1:2
    for N= nn
        cert = certtags{c};
        for d = dd
            name = [problem,num2str(N)];
            relname = [name,'_',cert,'_d',num2str(d),'_k',num2str(k)];
            b = exprobdata(name,relname);
            
            if b(2)&&b(3)&&b(4)
                load([id,'sols/sol',relname])
                load([id,'psols/psol',relname])
                fprintf('%d \t %d \t %6.4e \t %3.2f \t %6.1f \t %s  \n',N,d,psol.obj,psol.rnk,psol.ttot,[sol.info.msg1,sol.info.msg2,sol.info.msg2])
            else
                
                fprintf('%d \t %d \t %6.4e \t %3.2f \t %6.1f \t %s  \n',N,d,NaN,NaN,NaN,'not solved')
            end
        end
    end
end


