%Funzione che ritorna la struttura della 'somma dei quadrati'
function e = sumOfSquares()
    e.fun = @f;
    e.der = @d;
    e.lastLayerFun = @lastLayerFun;
end

%Funzione della 'somma dei quadrati'
function y= f(out,t)
    y = sum(sum((out-t).^2,2) /2);
end

%Derivata della 'somma dei quadrati'
function z = d(y,t)
    z = y-t;
end

%Funzione da applicare all'ultimo strato della rete durante la forward
%propagation
function y = lastLayerFun(x)
    y = x;
end

