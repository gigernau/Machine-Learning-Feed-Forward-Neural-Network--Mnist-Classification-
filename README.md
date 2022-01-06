# Machine-Learning-Feed-Forward-Neural-Network-Mnist-Classification-

## Program Language
Matlab

## Parte A 
Progettazione ed implementazione di funzioni per simulare la propagazione in avanti di una rete neurale multi-strato con almeno: due strati di pesi, con la 
sigmoide come funzione di output dei nodi interni e l’identità come funzione di output dei nodi di output. 
Permettere all’utente di implementare reti con più di uno 
strato di nodi interni e con qualsiasi funzione di output per ciascun strato.
Progettazione ed implementazione di funzioni per la realizzazione della backpropagation per reti neurali multi-strato con almeno: due strati di pesi, con la sigmoide come funzione di output dei nodi interni e l’identità come funzione di output dei nodi di output, con la somma dei quadrati o la cross entropy con soft-max come funzione di errore. 
Permettere all’utente di realizzare la back-propagation con più di uno strato di nodi interni, con qualsiasi funzione di output per ciascun strato e con qualsiasi funzione di errore derivabile rispetto all’output. 

## Parte B 
Si consideri come input le immagini raw del dataset mnist. 
Si ha, allora, un problema di classificazione a C classi, con C=10. Si estragga opportunamente un dataset globale di N coppie, e lo si divida opportunamente in training, validation e test set (ad esempio, 2000 per il training set, 500 per il validation set, 500 per il test set). Si fissi la resilient backpropagation (RProp) come algoritmo di aggiornamento dei pesi(aggiornamento batch). Si studi l'apprendimento di una rete neurale (ad esempio epoche necessarie per l’apprendimento, andamento dell’errore su 
training e validation set, accuratezza sul test) facendo variare il numero di strati interni da 1 a 5 confrontando il caso in cui si utilizza come funzione di 
output dei nodi la sigmoide con quello in cui si usa come funzione di output dei nodi la ReLu (max( 0, a )). Provare diverse scelte del numero dei nodi per 
gli strati interni. Se è necessario, per questioni di tempi computazionali e spazio in memoria, si possono ridurre (ad esempio dimezzarle) le dimensioni 
delle immagini raw del dataset mnist (ad esempio utilizzando in matlab la funzione imresize)

## Dataset
MNIST

## How use
Per l'utilizzo del programma è necessario effettuare il run dello script startNetScript.m.
Nella directory Codice è presente anche il dataset MNIST.
