%Funzione che ritorna la struttura dell'identit�
function s = identita()
    s.fun=@f;
    s.der=@d;
end

%Funzione identit�
function y = f(x)
    y=x;
end

%Derivata dell'identit�
function y = d(x)
    y=ones(size(x));
end
