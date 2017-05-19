for n= 40:40:120
    for cl = [10 20 40]
        if cl < n
            I = n_pattern(n,cl,5);
            pop = QuatFun(I);
            save(['functions/QP_quat_',num2str(n),'_',num2str(cl),'_',num2str(5)],'pop')
        end
    end
end

