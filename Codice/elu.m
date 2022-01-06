function s = elu()
    s.fun = @f;
    s.der = @d;
end

function y = f(x)
    y = (x>0).*x + (x<=0).*(0.1*(exp(x)-1));
end

function y=d(x)
    y = (x>0).*1 +  (x<=0).*(f(x)+0.1);
end

