%Funzione che ritorna la struttura della relu
function s = relu()
    s.fun = @f;
    s.der = @d;
end

%Funzione della relu
function y = f(x)
    y = max(0,x);
end

%Derivata della relu
function y=d(x)
    y = (x>0);
end