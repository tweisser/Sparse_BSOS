for n= 40:40:120
    for cl = [10 20 40]
        if cl < n
            I = n_pattern(n,cl,5);
            pop = QuadFun(I);
            save(['functions/QP_quad_',num2str(n),'_',num2str(cl),'_',num2str(5)],'pop')
        end
    end
end

