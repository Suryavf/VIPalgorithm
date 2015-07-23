%% Nonselective NTVA
%  --

clc
clear all
close all

% Load data
img     = imread('img/dog.jpg');
sizeImg = size(img);
exImg   = reflex(img,sizeImg);

% Saliency Map
[exSm,exI,exC,exO] = saliencyMap(exImg);

sm = iReflex(exSm,sizeImg);
ICO(:,:,1) = iReflex(exI ,sizeImg);
ICO(:,:,2) = iReflex(exC ,sizeImg);
ICO(:,:,3) = iReflex(exO ,sizeImg);

% Calculo de pesos wx
[obj,nObj] = clustering(sm);
PIj = [2 1.5 1];

nxj = sensoryEvidence(obj,nObj,ICO);
wx  = weightObject(nxj,PIj);
Wx  = normalizeWeights(wx);

% Reasignacion dinámica de los RF
[treeWin,win] = dynamicRemapping(wx,1:6);

% Activacion neuronal
beta = [1 1 1];
vxi  = neuronalRate(nxj,beta,Wx);

% VSTM