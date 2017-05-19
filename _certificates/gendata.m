function sdp = gendata(pop,d,k,algotag)
if nargin < 4
    if strcmp(k,'SPUT')
        k=0;
        algotag = 'SPUT';
    else
        error('not enough input arguments')
    end
end

if strcmp(algotag,'BSOS')
    tstart=clock;
    fprintf('\n This is BSOS')
    [blk,At,C,b,xrand,maxdeg] = genSDPdata(pop.F,pop.G,d,k);
    tGEN = etime(clock,tstart);
    sdp.id = 'BSOS';
    sdp.blk = blk;
    sdp.At = At;
    sdp.C = C;
    sdp.b = b;
    sdp.tGEN = tGEN;
    sdp.xrand = xrand;
    sdp.maxdeg = maxdeg;
    sdp.d = d;
    sdp.k = k;
elseif strcmp(algotag,'SBSOS')
    tstart=clock;
    [blk,At,C,b,constant,time,recy,degfg] = genSBSOSdata(pop.F,pop.G,pop.I,pop.J,d,k);
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
    sdp.d = d;
    sdp.k = k;
elseif strcmp(algotag,'SPUT')
    tstart=clock;
    [blk,At,C,b,constant,time,recy,degfg] = genSPUTdata(pop.F,pop.G,pop.I,pop.J,d);
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
    sdp.d = d;
    sdp.n = size(pop.F,2)-1;
else
    error('use algotag BSOS, SBSOS or SPUT')
end

end