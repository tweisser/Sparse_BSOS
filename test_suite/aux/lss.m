function lss(pop,name,cert,solver)
%LSS solves problem pop and saves it using the specification given in name.
%If a solution with the same name already exists, this solution is loaded
%instead.

init = true;
    
if nargin <4
    solver = 'sqlp';
end

id = [pwd,'/'];
relname = [name,'_',cert,'_d',num2str(pop.d)];
if isfield(pop,'k')
relname = [relname,'_k',num2str(pop.k)]; 
end
b = exprobdata(name,relname);

if b(1)&&b(2)
    load([id,'sdps/sdp',relname])
else
    %generate sdp
    sdp = gendata2(pop,cert,solver);
    save([id,'sdps/sdp',relname], 'sdp')
end

% solve problem
if b(1)&&b(2)&&b(3)
    load([id,'sols/sol',relname])
else
    if init
        sol = csol(sdp,solver);
        init = false;
    end
    sol = csol(sdp,solver);
    save([id,'sols/sol',relname], 'sol')
end

% postprocessing
if b(1)&&b(2)&&b(3)&&b(4)
    load([id,'psols/psol',relname])
else
    psol = postproc(pop,sdp,sol);
    save([id,'psols/psol',relname], 'psol')
end

end

