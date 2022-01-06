function [varW,varB] = initVariazioni(net,var)
    %Inizializzazione dei cell array
    varW = cell(1,net.nStrati);
    varB = cell(1,net.nStrati);
    %Per ogni strato si crea una matrice con tutti valori uguali a var.
    for strato=1:net.nStrati
       varW{strato} = var*ones(size(net.w{strato}));
       varB{strato} = var*ones(size(net.b{strato}));
    end

end

