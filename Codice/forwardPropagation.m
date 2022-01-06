function [net,z] = forwardPropagation(net,input,funErr)
    z = input;
    %Cardinalità degli elementi di input
    c = size(z,1);
    %Propagazione in avanti
    for strato= 1:net.nStrati
        a = (z * net.w{strato}') + repmat(net.b{strato},c,1);
        z = net.funzioni{strato}.fun(a);
        net.actValue{strato}=a;
        net.output{strato}=z;
    end
    %Applicazione di una ulteriore funzione sull'ultimo strato. Nel caso
    %della cross-entropy si tratta della softmax.
    net.output{net.nStrati} = funErr.lastLayerFun(net.output{net.nStrati});
    z = net.output{net.nStrati};
end