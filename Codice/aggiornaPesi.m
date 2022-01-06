function net = aggiornaPesi(net,derW,derB,eta)
    %Discesa del gradiente
    for strato=1 : net.nStrati
       net.w{strato} = net.w{strato} - eta*derW{strato};
       net.b{strato} = net.b{strato} - eta*derB{strato};
    end
end

