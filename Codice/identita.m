%Funzione che ritorna la struttura dell'identità
function s = identita()
    s.fun=@f;
    s.der=@d;
end

%Funzione identità
function y = f(x)
    y=x;
end

%Derivata dell'identità
function y = d(x)
    y=ones(size(x));
end
