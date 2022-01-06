%Funzione che ritorna la struttura della crossEntropy
function e = crossEntropy()
    e.fun = @f;
    e.der = @d;
    e.lastLayerFun = @lastLayerFun;
end

%Funzione della cross entropy
function y = f(out,target)
    y = -sum(sum(target .* log(max(out,0.09)),2));
end

%Derivata della cross entropy
function y = d(out,target)
    y = (out-target);
end 

%Funzione da applicare all'ultimo strato della rete durante la forward
%propagation
function y = lastLayerFun(x)
    y = softmax(x);
end

