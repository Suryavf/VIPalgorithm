%% Prueba mapas
clc
clear all
close all

img  = imread('img/dog.jpg');
r = double(img(177:1200,897:1920,1));
g = double(img(177:1200,897:1920,2));
b = double(img(177:1200,897:1920,3));

% img  = imread('img/oso.jpg');
% r = double(img(177:1200,177:1200,1));
% g = double(img(177:1200,177:1200,2));
% b = double(img(177:1200,177:1200,3));

% img  = imread('img/elefantes.jpg');
% r = double(img(1:1024,177:1200,1));
% g = double(img(1:1024,177:1200,2));
% b = double(img(1:1024,177:1200,3));

% p = 150; q = 200;
% img  = imread('img/castillo.jpg');
% r = double(img(p:p+1023,q:q+1023,1));
% g = double(img(p:p+1023,q:q+1023,2));
% b = double(img(p:p+1023,q:q+1023,3));

% Pesos
ak = [0.2909    0.2545    0.2182    0.1455    0.0727    0.0182];
%ak = [1 1 1   1 1 1];

%% Característica de intensidad 
I0 = (r+g+b)/3;
dI = pyramDifference(I0);

figure
set(gcf,'numbertitle','off','name','Caracteristica de Intensidad')
subplot(2,3,1); imshow(uint8( dI(:,:,1) ))
subplot(2,3,2); imshow(uint8( dI(:,:,2) ))
subplot(2,3,3); imshow(uint8( dI(:,:,3) ))
subplot(2,3,4); imshow(uint8( dI(:,:,4) ))
subplot(2,3,5); imshow(uint8( dI(:,:,5) ))
subplot(2,3,6); imshow(uint8( dI(:,:,6) ))

% Mapa de Intensidad
Imap = normalize(dI(:,:,1)) + normalize(dI(:,:,2)) + ...
       normalize(dI(:,:,3)) + normalize(dI(:,:,4)) + ...
       normalize(dI(:,:,5)) + normalize(dI(:,:,6));
Imap = Imap/norm(Imap);
Ip   = stand(Imap);

%% Caracteristica de orientacion
sigX = 10;    sigY  = 2;
f0   = 1/5; sizeW = 39;

O0   = filterGabor(I0,sigX,sigY,f0,   0,sizeW);
O45  = filterGabor(I0,sigX,sigY,f0,pi/4,sizeW);
O90  = filterGabor(I0,sigX,sigY,f0,pi/2,sizeW);
O135 = filterGabor(I0,sigX,sigY,f0,3*pi/4,sizeW);

dO0   = pyramNDifference(O0  );
dO45  = pyramNDifference(O45 );
dO90  = pyramNDifference(O90 );
dO135 = pyramNDifference(O135);

% Mapa de Intensidad
O0map = normalize(dO0(:,:,1)) + normalize(dO0(:,:,2)) + ...
        normalize(dO0(:,:,3)) + normalize(dO0(:,:,4)) + ...
        normalize(dO0(:,:,5)) + normalize(dO0(:,:,6));

O45map = normalize(dO45(:,:,1)) + normalize(dO45(:,:,2)) + ...
         normalize(dO45(:,:,3)) + normalize(dO45(:,:,4)) + ...
         normalize(dO45(:,:,5)) + normalize(dO45(:,:,6));

O90map = normalize(dO90(:,:,1)) + normalize(dO90(:,:,2)) + ...
         normalize(dO90(:,:,3)) + normalize(dO90(:,:,4)) + ...
         normalize(dO90(:,:,5)) + normalize(dO90(:,:,6));

O135map = normalize(dO135(:,:,1)) + normalize(dO135(:,:,2)) + ...
          normalize(dO135(:,:,3)) + normalize(dO135(:,:,4)) + ...
          normalize(dO135(:,:,5)) + normalize(dO135(:,:,6));

Omap = normalize(O0map ) + normalize(O45map )+ ...
       normalize(O90map) + normalize(O135map);

  O0map = stand(O0map);
 O45map = stand(O45map);
 O90map = stand(O90map);
O135map = stand(O135map);
Op      = stand(Omap);

figure
set(gcf,'numbertitle','off','name','Caracteristica de Orientacion')
subplot(2,2,1); imshow(uint8(O0map  ))
subplot(2,2,2); imshow(uint8(O45map ))
subplot(2,2,3); imshow(uint8(O90map ))
subplot(2,2,4); imshow(uint8(O135map))

%% Sistema de Color Doble Oponente Complementado
[rows cols] = size(r);

for i=1:rows
    for j=1:cols
        R(i,j) = r(i,j) - (g(i,j)+b(i,j))/2;
        G(i,j) = g(i,j) - (b(i,j)+r(i,j))/2;
        B(i,j) = b(i,j) - (r(i,j)+g(i,j))/2;
        Y(i,j) = (r(i,j)+g(i,j))/2-abs(r(i,j)-g(i,j))/2-b(i,j);
        
        if(R(i,j)<=0) R(i,j)=0; end
        if(G(i,j)<=0) G(i,j)=0; end
        if(B(i,j)<=0) B(i,j)=0; end
        if(Y(i,j)<=0) Y(i,j)=0; end
    end
end

dRG = pyramNDifference(R-G);
dBY = pyramNDifference(B-Y);
dRC = pyramNDifference(R+Y-G-B);
dGM = pyramNDifference(G+Y-R-B);

% Mapa de Intensidad
RGmap = normalize(dRG(:,:,1)) + normalize(dRG(:,:,2)) + ...
        normalize(dRG(:,:,3)) + normalize(dRG(:,:,4)) + ...
        normalize(dRG(:,:,5)) + normalize(dRG(:,:,6));

BYmap = normalize(dBY(:,:,1)) + normalize(dBY(:,:,2)) + ...
        normalize(dBY(:,:,3)) + normalize(dBY(:,:,4)) + ...
        normalize(dBY(:,:,5)) + normalize(dBY(:,:,6));

RCmap = normalize(dRC(:,:,1)) + normalize(dRC(:,:,2)) + ...
        normalize(dRC(:,:,3)) + normalize(dRC(:,:,4)) + ...
        normalize(dRC(:,:,5)) + normalize(dRC(:,:,6));

GMmap = normalize(dGM(:,:,1)) + normalize(dGM(:,:,2)) + ...
        normalize(dGM(:,:,3)) + normalize(dGM(:,:,4)) + ...
        normalize(dGM(:,:,5)) + normalize(dGM(:,:,6));

Cmap = RGmap + BYmap + RCmap + GMmap;

RGmap = stand(RGmap);
BYmap = stand(BYmap);
RCmap = stand(RCmap);
GMmap = stand(GMmap);
Cp    = stand(Cmap);

figure
set(gcf,'numbertitle','off','name','Caracteristica de Color')
subplot(2,2,1); imshow(uint8(RGmap))
subplot(2,2,2); imshow(uint8(BYmap))
subplot(2,2,3); imshow(uint8(RCmap))
subplot(2,2,4); imshow(uint8(GMmap))

%% Resultado
S = (Imap + Cmap + Omap)/3;
S = stand(S);

figure
set(gcf,'numbertitle','off','name','Caracteristicas de la imagen')
subplot(1,3,1); imshow(uint8(Ip)); title('Mapa de Intensidad') 
subplot(1,3,2); imshow(uint8(Op)); title('Mapa de Orientacion')
subplot(1,3,3); imshow(uint8(Cp)); title('Mapa de Color')

mS = (S - min(min(S)))*255/max(max(S));
mS = mS.^2.5;
mS = stand(mS);

figure
set(gcf,'numbertitle','off','name','Salency Map')
imshow(uint8(mS))