clc
clear all
close all

img   = imread('/home/victor/Documentos/Projects/VIPalgorithm/img/Lenna.png');
sizeImg = size(img);
sizeImg = sizeImg(2:-1:1);

exImg = reflex(img,sizeImg);

exSm = saliencyMap(exImg);
exSm = imresize(exSm,4,'bilinear');
sm   = iReflex(exSm,sizeImg);
sm = stand(sm);

subplot(1,2,1); imshow(img)
subplot(1,2,2); imshow(uint8(sm))