function net = createNetwork(vettoreStrati,vettoreFunzioni,pesi)
    nStrati = length(vettoreStrati) - 1;
    w = cell(1,nStrati);
    b = cell(1,nStrati);
    dim1 = vettoreStrati(1);
    for strato = 1:nStrati 
       dim2 = vettoreStrati(strato+1); 
       w{strato} = pesi - (2*pesi)*rand(dim2,dim1);
       b{strato} = pesi - (2*pesi)*rand(1,dim2);
       dim1=dim2; 
    end
    net.w=w;
    net.b=b;
    net.nStrati = nStrati;
    net.funzioni = vettoreFunzioni;
    net.actValue = cell(1,nStrati);
    net.output = cell(1,nStrati);
end

