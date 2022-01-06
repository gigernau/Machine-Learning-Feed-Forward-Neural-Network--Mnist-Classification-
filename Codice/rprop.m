function [net,oldDerW,oldDerB,varW,varB] = rprop(net,derW,derB,oldDerW,oldDerB,varW,varB,etaP,etaN)
for strato=1:net.nStrati
    %Segno del prodotto tra le nuove e le vecchie derivate.
    signProd = sign(oldDerW{strato} .* derW{strato});
    %Individuazione degli eta da utilizzare nell'aggiornamento dei pesi
    etaM = ((signProd>0) * etaP) + ((signProd<0) * etaN) + ((signProd==0) * 1);
    %Calcolo del delta che rappresenta la variazione del peso
    varW{strato} = etaM .* varW{strato};
    %I delta sono compresi tra 1e-6 e 50
    varW{strato} = min(max(varW{strato},0.000001),50);
    %Aggiornamento dei pesi
    net.w{strato} = net.w{strato} - (sign(derW{strato}) .* varW{strato});
    
    %Segno del prodotto tra le nuove e le vecchie derivate.
    signProd = sign(oldDerB{strato} .* derB{strato});
    %Individuazione degli eta da utilizzare nell'aggiornamento dei bias
    etaM = ((signProd>0) * etaP) + ((signProd<0) * etaN) + ((signProd==0) * 1);
    %Calcolo del delta che rappresenta la variazione del bias
    varB{strato} = etaM .* varB{strato};
    %I delta sono compresi tra 1e-6 e 50
    varB{strato} = min(max(varB{strato},0.000001),50);
    %Aggiornamento dei bias
    net.b{strato} = net.b{strato} - (sign(derB{strato}) .* varB{strato});
    
end
oldDerW = derW;
oldDerB = derB;
end