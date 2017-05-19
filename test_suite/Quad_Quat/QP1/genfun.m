nn= [50 50];
for oo = [40 30 20 10 5 1];
    I = pattern(nn,oo);
    pop = QuadFun(I);
    save(['functions/QPI_',num2str(oo)],'pop')
end
 

