function [predictia_ceruta1] =regresie(n)
load ("data.mat", "A") %datele din curs pentru populatiile dintre anii 1950-1985
%sunt 8 ani pentru care cunoastem populatia

%preluarea datelor
an = A(:,1) %vectorul anilor
pop = A(:,2) %vectorul populatiilor

%initializarea seeed-ului pt functia random
rng(1234);

%generarea seturilor de date de antrenament ?i de testare
ind_antr = 1:9; % antrenam pe toate datele
%ind_antr = randperm(9, 6); %permutare random(permutarea a noua elemente din vector)
%dintre care 6(datele de antrenament) se retin in vector

%ind_antr = randPerm(9);
%ind_antr = ind_antr(1:8);

%obtinerea acelor indici care nu au fost selectati ca set de date de testare
indTest = 1 : 9; % testam pe toate datele, daca decomentam randul de mai jos se iau doar indicii care nu sunt in antrenament
%indTest(ind_antr) = [];

%construirea datelor de test si de antrenament
Xantr = an(ind_antr, :);
Yantr = pop(ind_antr);
Xtest = an(indTest, :); 
Ytest = pop(indTest);
%regr = trainX \ trainy
regr = cmmp(Xantr,Yantr);  %coeficientul de regresie()
%modelul liniar -> fitlm
%am pus RobustOpts off pentru a face cu cmmp
model_liniar = fitlm(Xantr, Yantr, 'linear', 'RobustOpts', 'off');

model_liniar 
%predictia: prezicerea pe datele de test
yprezis = predict(model_liniar, Xtest);

%diferenta dintre predictie si datele reale
diffPredict = abs(yprezis - Ytest);   

scatter(an, pop) %trecerea datelor din tabel pe grafic
hold on
plot(Xtest, yprezis) 
xlabel('Anul')
ylabel('Populatia')
title('Regresie liniara intre an si populatie')
grid on

predictia_ceruta1 = predict(model_liniar, 2017);
predictia_ceruta2 = predict(model_liniar, 1950);
predictia_ceruta3 = predict(model_liniar, 1990);
yprezis
mean(diffPredict)
end