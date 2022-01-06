function s = lrelu()
    s.fun = @f;
    s.der = @d;
end

function y = f(x)
    y = (x>=0).*x + (x<0).*(0.2*x);
end

function y=d(x)
    y = (x>0).*1 + (x==0).*0 + (x<0).*(0.2);
end