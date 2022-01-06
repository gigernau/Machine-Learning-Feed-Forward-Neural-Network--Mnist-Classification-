function bestNet = ParteA_trainingBatch( vettoreStrati, vettoreFunzioni,pesi,funErr,trainingSet,validationSet,nEpoche,eta,soglia)
    %Creazione di una rete neurale
    net = createNetwork(vettoreStrati, vettoreFunzioni,pesi); 
    %Array degli errori per training set e validation set
    errT = zeros(1,nEpoche);
    errV = zeros(1,nEpoche);
    errMin = realmax;
    %Processo di addestramento
    e=1;
    stop=0;
    while(e<=nEpoche && stop==0) 
        [net,output] = forwardPropagation(net,trainingSet.images,funErr);
        [net,delta] = backPropagation(net,output,trainingSet.targets,funErr);
        [derW,derB] = calcolaDerivate(net,delta,trainingSet.images);
        [net] = aggiornaPesi(net,derW,derB,eta);
        %Calcolo dell'errore su training set
        [net,out]=forwardPropagation(net,trainingSet.images,funErr);
        errT(e) = funErr.fun(out,trainingSet.targets)/size(trainingSet.targets,1);
        %Calcolo dell'errore su validation set
        [net,out]=forwardPropagation(net,validationSet.images,funErr);
        errV(e) = funErr.fun(out,validationSet.targets)/size(validationSet.targets,1);
        %Se l'errore all'epoca corrente è minore del minimo ottenuto, la
        %rete corrente diventa la migliore.
        if errV(e) < errMin
            errMin = errV(e);
            bestNet = net;
        end
        %Stampa degli errori
        fprintf("e: %d errT: %.7f errV: %.7f\n",e,errT(e),errV(e));
        %Criterio di fermata
        t = abs(100*((errMin/errV(e))-1));
        if(t > soglia)
            stop = 1;
        end
        e=e+1;
        
    end
    %Stampa errore minimo
    fprintf("Errore minimo validation: %.7f\n",errMin);
    figure 
    x=1:nEpoche;
    plot(x,errT(x),x,errV(x));
    xlabel('Epoche ') % x-axis label
    ylabel('Valori di errore ') % y-axis label
    legend('Errore Training Set','Errore Validation Set')
end



