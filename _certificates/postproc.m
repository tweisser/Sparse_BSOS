    %%***************************************************************%%
    % This is a function to post process BSOS and SBSOS data after    %
    % solving the SDP with SDPT3                                      %
    %%***************************************************************%%

    function psol = postproc(pop,sdp,sol)

    if strcmp(sdp.id,'BSOS')
        tstart = clock;
        psol.obj = (-sol.obj(1));
        [psol.rnk, psol.mineig] = rankBSOS(sdp.n,sdp.k,sol.y,sdp.xrand);
        tval = etime(clock,tstart);
        psol.obj = (-sol.obj(1));
    elseif strcmp(sdp.id,'SBSOS')
        tstart = clock;
        psol.obj = (-sol.obj(1))+sdp.constant;
        YY = recovery(sdp.recy,sol.y);
        if 1
            [RANK,mineig] = rankSBSOS(YY,sdp.recy.I,sdp.k);
            psol.rnk = sum(RANK)/length(RANK);
            psol.mineig = mineig;
            psol.YY = YY;
            if (psol.rnk ==1)&&(mineig > -10^6)
                psol.xsol = mom2x(YY,pop);
                ccontrol=zeros(length(pop.G),1);
                for j = 1:length(pop.G)
                    ccontrol(j) = evalpoly(pop.G{j},psol.xsol);
                end
                if any(ccontrol<-10^-6)||any(ccontrol>1+10^-6)
                    fprintf('Check constraints control: %d constraints might be violated.\n',sum(ccontrol<-10^-6)+sum(ccontrol>1+10^-6));
                end
                psol.fx=evalpoly(pop.F,psol.xsol);
                psol.ccontrol = ccontrol;
                fprintf('\n average rank M(y) = %2.1f \n minimal eigenvalue = %2.4e \n',psol.rnk,mineig)
                fprintf('\n optimal solution extracted: \n f(x) = %2.4e \n', full(psol.fx))
            end
        end
        tval = etime(clock,tstart);
        psol.obj = (-sol.obj(1))+sdp.constant;
    elseif strcmp(sdp.id,'SPUT')
        tstart = clock;
        psol.obj = (-sol.obj(1))+sdp.constant;
        YY = recovery(sdp.recy,sol.y);
        [RANK,mineig] = rankSPUT(YY,sdp.recy.I,sdp.degfg,pop.d);
        psol.rnk = sum(RANK)/length(RANK);
        psol.mineig = mineig;
        psol.YY = YY;
        if psol.rnk ==1
            psol.xsol = mom2x(YY,pop);
            ccontrol=zeros(length(pop.G),1);
            for j = 1:length(pop.G)
                ccontrol(j) = evalpoly(pop.G{j},psol.xsol);
            end
            if any(ccontrol<-10^-6)||any(ccontrol>1+10^-6)
                fprintf('Check constraints control: %d constraints might be violated.\n',sum(ccontrol<-10^-6)+sum(ccontrol>1+10^-6));
            end
            psol.fx=evalpoly(pop.F,psol.xsol);
            psol.ccontrol = ccontrol;
            fprintf('\n average rank M(y) = %2.1f \n minimal eigenvalue = %2.4e \n',psol.rnk,mineig)
            fprintf('\n optimal solution extracted: \n f(x) = %2.4e \n', psol.fx)
        end
        tval = etime(clock,tstart);
    else
        error('can not postproc this algotag')
    end

    psol.ttot = sdp.tGEN + sol.tSOL + tval;
    fprintf('\n primal objective value: %2.4e \n', psol.obj)


    end