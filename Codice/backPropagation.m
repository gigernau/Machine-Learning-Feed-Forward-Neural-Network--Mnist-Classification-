function [net,delta] = backPropagation(net,output,targets,funErr)
    %Inizializzazione di un cell array per i delta.
    delta = cell(1,net.nStrati);
    %Calcolo dei delta all'ultimo strato
    delta{net.nStrati} = funErr.der(output,targets);
    %Calcolo dei delta per i strati interni
    for strato = (net.nStrati-1) : -1 : 1
       delta{strato} = delta{strato+1} * net.w{strato+1}; 
       delta{strato} = net.funzioni{strato}.der(net.actValue{strato}) .* delta{strato};
    end
end

