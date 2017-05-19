for p=100:300:1000
    for cl = [4 5]
            I = pattern(cl,cl-3,p);
            pop = QuadFun(I);
            save(['functions/QP_ls_',num2str(p),'x',num2str(cl),'_',num2str(cl-3)],'pop')
    end
end

