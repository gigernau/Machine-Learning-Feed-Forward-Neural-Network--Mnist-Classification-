training = loadMNIST('train-images-idx3-ubyte','train-labels-idx1-ubyte');
test = loadMNIST('t10k-images-idx3-ubyte','t10k-labels-idx1-ubyte');

sizeTraining=50000;
sizeValidation=10000;
nEpoche=200;
eta=0.000001;
etaP=1.2;
etaN=0.5;
variation=0.001;
pesi=0.01;
soglia=10;

tipo=0; %0-RProp, 1-batch/discesa del gradiente, 2-online/discesa del gradiente

training.Labels(training.Labels==0)=10;
trainingTargets = dummyvar(training.Labels);

trainingSet.images = training.Images(1:sizeTraining,:);
trainingSet.targets = trainingTargets(1:sizeTraining,:);
validationSet.images = training.Images(sizeTraining+1:sizeTraining+sizeValidation,:);
validationSet.targets = trainingTargets(sizeTraining+1:sizeTraining+sizeValidation,:);


attivazioneInterna=relu();
identita=identita();
funErr=crossEntropy();

if(tipo==0)
    net = trainingRProp([784 200 10],{ attivazioneInterna identita}, pesi, funErr, trainingSet, validationSet, nEpoche, eta,etaP, etaN, variation,soglia);
elseif(tipo==1)
    net=ParteA_trainingOnline( [784 50 10],{ attivazioneInterna identita},pesi,funErr,trainingSet,validationSet,nEpoche,eta,soglia);
else
    net=ParteA_trainingBatch( [784 50 10],{ attivazioneInterna identita},pesi,funErr,trainingSet,validationSet,nEpoche,eta,soglia);
end
    accuracy = testing(net,test,funErr);
    fprintf("accuracy: %.4f\n",accuracy);
