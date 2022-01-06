function acc = testing(net,testSet,funErr)
    acc=0;
    for i=1:size(testSet.Images,1)
        net = forwardPropagation(net,testSet.Images(i,:),funErr);
        [val,k]=max(net.output{net.nStrati});
        %fprintf("BEST: immagine: %d, MAX: %.7f, res: %d, label: %d\n",i,max(net.output{net.nStrati}),k,test.Labels(i,1));
        if(k==10) 
            k=0;
        end
        if( k == testSet.Labels(i,1))
            acc=acc+1;
        end
    end
    acc = acc/size(testSet.Images,1);
end

