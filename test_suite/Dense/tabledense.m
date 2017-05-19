%table 
%% Dense examples

BSOSsolver = 'sqlp';
SBSOSsolver = 'sqlp';


%% Examples

EX{1} = 'test4_2'; EX{2} = 'test4_4'; EX{3} = 'test4_6'; EX{4} = 'test4_8';
EX{5} = 'test6_2'; EX{6} = 'test6_4'; EX{7} = 'test6_6'; EX{8} = 'test8_2';
EX{9} = 'test8_4'; EX{10} = 'test10_2'; EX{11} = 'test10_4'; EX{12} = 'test20_2';

kk = [1 2 3 4 1 2 3 1 2 1 2 1];
dd = [1 2 3 3 1 3 3 1 2 1 2 1];

%% Go
id = [pwd,'/'];
fprintf('prob \t \t d \t sol \t \t rnk \t time \t algo \t message \n')
for eg = [1:12]
    tag = EX{eg};
    k = kk(eg);
    for d = 1:dd(eg)
        load([id,'psols/psol',tag,'_BSOS','_d',num2str(d),'_k',num2str(k)], 'psol');
        load([id,'sols/sol',tag,'_BSOS','_d',num2str(d),'_k',num2str(k)], 'sol');
        fprintf('%s \t %d \t %6.4e \t %d \t %2.1f \t %s \t %s\n', tag,d,psol.obj,psol.rnk,psol.ttot, 'BSOS',[sol.info.msg1,sol.info.msg2,sol.info.msg3])
        load([id,'psols/psol',tag,'_SBSOS','_d',num2str(d),'_k',num2str(k)], 'psol');
        load([id,'sols/sol',tag,'_SBSOS','_d',num2str(d),'_k',num2str(k)], 'sol');
        fprintf('%s \t %d \t %6.4e \t %d \t %2.1f \t %s \t %s\n', tag,d,psol.obj,psol.rnk,psol.ttot, 'SBSOS',[sol.info.msg1,sol.info.msg2,sol.info.msg3])
    end
end
