clc
clear all
close all

img   = imread('C:\Users\PIERO\Documents\Proyectos Electrónica\En Proceso\VIP Algorithm\GIT Repository\VIPalgorithm\img\dog.jpg');
sizeImg = size(img);
sizeImg = sizeImg(2:-1:1);

exImg = reflex(img,sizeImg);

exSm = saliencyMap(exImg);
exSm = imresize(exSm,4,'bilinear');
sm   = iReflex(exSm,sizeImg);
sm = stand(sm);

subplot(1,2,1); imshow(img)
subplot(1,2,2); imshow(uint8(sm))