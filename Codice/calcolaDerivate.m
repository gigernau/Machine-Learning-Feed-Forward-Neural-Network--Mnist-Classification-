function [derW,derB] = calcolaDerivate(net,delta,input)
    %Inizializzazione di cell array per le derivate dei pesi e dei bias
    derW = cell(1,net.nStrati);
    derB = cell(1,net.nStrati);
    %Calcolo delle derivate per tutti i pesi
    z = input;
    for strato=1 : net.nStrati
        derW{strato} = delta{strato}' *z; 
        derB{strato} = sum(delta{strato},1);
        z = net.output{strato};
    end 
end

