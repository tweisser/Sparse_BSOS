function b = expop(name)
eval(['exist ',pwd,'/pops/pop',name,'.mat;']); 
b = ans;
