function b = exprobdata(name,relname)
id = pwd;
b = zeros(4,1);
eval(['exist ',id,'/pops/pop',name,'.mat;']); b(1) = ans;
eval(['exist ',id,'/sdps/sdp',relname,'.mat;']); b(2) = ans;
eval(['exist ',id,'/sols/sol',relname,'.mat;']); b(3) = ans;
eval(['exist ',id,'/psols/psol',relname,'.mat;']); b(4) = ans;
