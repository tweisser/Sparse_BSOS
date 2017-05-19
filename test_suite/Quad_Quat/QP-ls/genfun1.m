for p=50:150:500
    for cl = [8 9]
            I = pattern(cl,cl-6,p);
            pop = QuadFun(I);
            save(['functions/QP_ls_',num2str(p),'x',num2str(cl),'_',num2str(cl-6)],'pop')
    end
end

