function sdp = gendata2(pop,algotag,solvertag)
if nargin < 3
    convert2solvertag = 0;
else
    convert2solvertag = 1;
end

if strcmp(algotag,'BSOS')
    tstart=clock;
    fprintf('\n This is BSOS')
    [blk,At,C,b,xrand,maxdeg] = genSDPdata(pop.F,pop.G,pop.d,pop.k);
    tGEN = etime(clock,tstart);
    sdp.id = 'BSOS';
    sdp.blk = blk;
    sdp.At = At;
    sdp.C = C;
    sdp.b = b;
    sdp.tGEN = tGEN;
    sdp.xrand = xrand;
    sdp.maxdeg = maxdeg;
    sdp.d = pop.d;
    sdp.k = pop.k;
    sdp.n = size(pop.F,2)-1;
elseif strcmp(algotag,'SBSOS')
    tstart=clock;
    [blk,At,C,b,constant,time,recy,degfg] = genSBSOSdata(pop.F,pop.G,pop.I,pop.J,pop.d,pop.k);
    tGEN = etime(clock,tstart);
    sdp.id = 'SBSOS';
    sdp.blk = blk;
    sdp.At = At;
    sdp.C = C;
    sdp.b = b;
    sdp.tGEN = tGEN;
    sdp.constant = constant;
    sdp.recy = recy;
    sdp.degfg = degfg;
    sdp.d = pop.d;
    sdp.k = pop.k;
    sdp.n = size(pop.F,2)-1;
    
elseif strcmp(algotag,'SPUT')
    tstart=clock;
    [blk,At,C,b,constant,time,recy,degfg] = genSPUTdata(pop.F,pop.G,pop.I,pop.J,pop.d);
    tGEN = etime(clock,tstart);
    sdp.id = 'SPUT';
    sdp.blk = blk;
    sdp.At = At;
    sdp.C = C;
    sdp.b = b;
    sdp.tGEN = tGEN;
    sdp.constant = constant;
    sdp.recy = recy;
    sdp.degfg = degfg;
    sdp.d = pop.d;
    sdp.n = size(pop.F,2)-1;
else
    error('use algotag BSOS, SBSOS or SPUT')
end

if convert2solvertag&&strcmp(solvertag,'sedumi')
    fprintf('\n Converting to SeDuMi format... \n')
    tstart=clock;
    [At,b,c,K] = sdpt3tosedumi(blk,At,C,b);
    tGEN = tGEN + etime(clock,tstart);
    recy.converted = 'sedumi';
    sdp.blk = K;
    sdp.At = At;
    sdp.C = c;
    sdp.b = b;
    sdp.tGEN = tGEN;
    sdp.recy = recy;
    if strcmp(algotag,'BSOS')
        sdp.pars.sdp = 0;
    elseif length(pop.I)==1
        sdp.pars.sdp = 0;
    else
        sdp.pars.sdp = 1;
    end
end