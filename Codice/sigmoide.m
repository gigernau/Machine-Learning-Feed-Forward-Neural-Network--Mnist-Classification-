%Funzione che ritorna la struttura della sigmoide
function s = sigmoide()
    s.fun=@f;
    s.der=@d;
end

%Funzione della sigmoide
function y = f(x)
    y = 1 ./ (1+exp(-x));
end

%Derivata della sigmoide
function y = d(x)
    y = f(x) .* (1-f(x));
end