%%***********************************************************%%
% This function recovers the original dual variable from the  %
% output of the solver                                        %
%%***********************************************************%%    

function  YY  = recovery(recy,yy)
    

    %% first recover y for dependent constraints
    if recy.RemoveDependent
        y1 = recy.y0;
        y1(recy.idxB) = yy;
    else
        y1 = yy;
    end
    
    %% second recover y for removed variables
    if recy.RemoveFixvar
        y2 = zeros(recy.m,1);
        y2(recy.scols) = y1;
        y3 = recy.R*y2;
    else
        y3 = y1;
    end

    %% build sequences of moments

    YY = getmoments(y3,recy.At,recy.I,recy.degFl,recy.nspcons);
    end

