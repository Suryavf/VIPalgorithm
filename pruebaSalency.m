%% Prueba mapas
clc
clear all
close all

% im  = imread('img/babu.jpg');
% img = im(1:512,129:1152,1:3);
im  = imread('img/Lenna.png');
img = imresize(im,2,'bicubic');

metInt = 'bilinear';

r   = double(img(:,:,1));
g   = double(img(:,:,2));
b   = double(img(:,:,3));

%% Característica de intensidad 
I0 = (r+g+b)/3;       I1 = piramGaussJ(I0); I2 = piramGaussJ(I1); 
I3 = piramGaussJ(I2); I4 = piramGaussJ(I3); I5 = piramGaussJ(I4); 
I6 = piramGaussJ(I5); I7 = piramGaussJ(I6); I8 = piramGaussJ(I7);

I25i = imresize(I5, 8,metInt); I26i = imresize(I6,16,metInt);
I36i = imresize(I6, 8,metInt); I37i = imresize(I7,16,metInt);
I47i = imresize(I7, 8,metInt); I48i = imresize(I8,16,metInt);

I25 = abs(I2 - I25i); I26 = abs(I2 - I26i);
I36 = abs(I3 - I36i); I37 = abs(I3 - I37i);
I47 = abs(I4 - I47i); I48 = abs(I4 - I48i);

I25 = imresize(I25,2,metInt); I26 = imresize(I26,2,metInt);
I36 = imresize(I36,4,metInt); I37 = imresize(I37,4,metInt);
I47 = imresize(I47,8,metInt); I48 = imresize(I48,8,metInt);

figure
set(gcf,'numbertitle','off','name','Caracteristica de Intensidad')
subplot(2,3,1); imshow(uint8(I25))
subplot(2,3,2); imshow(uint8(I26))
subplot(2,3,3); imshow(uint8(I36))
subplot(2,3,4); imshow(uint8(I37))
subplot(2,3,5); imshow(uint8(I47))
subplot(2,3,6); imshow(uint8(I48))

% Mapa de Intensidad
Imap = I25 + I26 + I36 + I37 + I47 + I48;
Imap = stand(Imap);

figure
imshow(uint8(Imap))

%% Caracteristica de color
Rp = r/255; Gp = g/255; Bp = b/255; 
K = 1 - max(max(Rp,Gp),Bp);
Y = (1-Bp-K)./(1-K);

RG0 = Rp-Gp;            RG1 = piramGaussJ(RG0); RG2 = piramGaussJ(RG1); 
RG3 = piramGaussJ(RG2); RG4 = piramGaussJ(RG3); RG5 = piramGaussJ(RG4); 
RG6 = piramGaussJ(RG5); RG7 = piramGaussJ(RG6); RG8 = piramGaussJ(RG7);

BY0 = Bp-Y;             BY1 = piramGaussJ(BY0); BY2 = piramGaussJ(BY1); 
BY3 = piramGaussJ(BY2); BY4 = piramGaussJ(BY3); BY5 = piramGaussJ(BY4); 
BY6 = piramGaussJ(BY5); BY7 = piramGaussJ(BY6); BY8 = piramGaussJ(BY7);

RG25i = imresize(-RG5, 8,metInt); RG26i = imresize(-RG6,16,metInt);
RG36i = imresize(-RG6, 8,metInt); RG37i = imresize(-RG7,16,metInt);
RG47i = imresize(-RG7, 8,metInt); RG48i = imresize(-RG8,16,metInt);

BY25i = imresize(-BY5, 8,metInt); BY26i = imresize(-BY6,16,metInt);
BY36i = imresize(-BY6, 8,metInt); BY37i = imresize(-BY7,16,metInt);
BY47i = imresize(-BY7, 8,metInt); BY48i = imresize(-BY8,16,metInt);

RG25 = abs(RG2-RG25i); RG26 = abs(RG2-RG26i);
RG36 = abs(RG3-RG36i); RG37 = abs(RG3-RG37i);
RG47 = abs(RG4-RG47i); RG48 = abs(RG4-RG48i);

BY25 = abs(BY2-BY25i); BY26 = abs(BY2-BY26i);
BY36 = abs(BY3-BY36i); BY37 = abs(BY3-BY37i);
BY47 = abs(BY4-BY47i); BY48 = abs(BY4-BY48i);


figure
subplot(2,3,1); imshow(uint8(RG25*255))
subplot(2,3,2); imshow(uint8(RG26*255))
subplot(2,3,3); imshow(uint8(RG36*255))
subplot(2,3,4); imshow(uint8(RG37*255))
subplot(2,3,5); imshow(uint8(RG47*255))
subplot(2,3,6); imshow(uint8(RG48*255))
set(gcf,'numbertitle','off','name','Caracteristica de color RG')

figure
subplot(2,3,1); imshow(uint8(BY25*255))
subplot(2,3,2); imshow(uint8(BY26*255))
subplot(2,3,3); imshow(uint8(BY36*255))
subplot(2,3,4); imshow(uint8(BY37*255))
subplot(2,3,5); imshow(uint8(BY47*255))
subplot(2,3,6); imshow(uint8(BY48*255))
set(gcf,'numbertitle','off','name','Caracteristica de color BY')

% Mapa de color
RG36r = imresize(RG36,2,'bicubic'); RG37r = imresize(RG37,2,'bicubic');
RG47r = imresize(RG47,4,'bicubic'); RG48r = imresize(RG48,4,'bicubic');

BY36r = imresize(BY36,2,'bicubic'); BY37r = imresize(BY37,2,'bicubic');
BY47r = imresize(BY47,4,'bicubic'); BY48r = imresize(BY48,4,'bicubic');

Cmap = RG25 + RG26 + RG36r + RG37r + RG47r + RG48r + ...
       BY25 + BY26 + BY36r + BY37r + BY47r + BY48r;
Cmap = Cmap./norm(Cmap);

%% Caracteristica de orientacion
sigX = 5;
sigY = 1;
f0   = 1/4.5;
sizeW= 19;

O0   = filterGabor(I0,sigX,sigY,f0,   0,sizeW);
O45  = filterGabor(I0,sigX,sigY,f0,pi/4,sizeW);
O90  = filterGabor(I0,sigX,sigY,f0,pi/2,sizeW);
O135 = filterGabor(I0,sigX,sigY,f0,3*pi/4,sizeW);

% figure
% subplot(2,2,1); imshow(uint8(stand(O0)))
% subplot(2,2,2); imshow(uint8(stand(O45)))
% subplot(2,2,3); imshow(uint8(stand(O90)))
% subplot(2,2,4); imshow(uint8(stand(O135)))

O0_1 = piramGaussJ(  O0); O0_2 = piramGaussJ(O0_1); 
O0_3 = piramGaussJ(O0_2); O0_4 = piramGaussJ(O0_3); 
O0_5 = piramGaussJ(O0_4); O0_6 = piramGaussJ(O0_5); 
O0_7 = piramGaussJ(O0_6); O0_8 = piramGaussJ(O0_7);

O45_1 = piramGaussJ(  O45); O45_2 = piramGaussJ(O45_1); 
O45_3 = piramGaussJ(O45_2); O45_4 = piramGaussJ(O45_3); 
O45_5 = piramGaussJ(O45_4); O45_6 = piramGaussJ(O45_5); 
O45_7 = piramGaussJ(O45_6); O45_8 = piramGaussJ(O45_7);

O90_1 = piramGaussJ(  O90); O90_2 = piramGaussJ(O90_1); 
O90_3 = piramGaussJ(O90_2); O90_4 = piramGaussJ(O90_3); 
O90_5 = piramGaussJ(O90_4); O90_6 = piramGaussJ(O90_5); 
O90_7 = piramGaussJ(O90_6); O90_8 = piramGaussJ(O90_7);

O135_1 = piramGaussJ(  O135); O135_2 = piramGaussJ(O135_1); 
O135_3 = piramGaussJ(O135_2); O135_4 = piramGaussJ(O135_3); 
O135_5 = piramGaussJ(O135_4); O135_6 = piramGaussJ(O135_5); 
O135_7 = piramGaussJ(O135_6); O135_8 = piramGaussJ(O135_7);

O0_25i = imresize(O0_5, 8,'bicubic'); O0_26i = imresize(O0_6,16,'bicubic');
O0_36i = imresize(O0_6, 8,'bicubic'); O0_37i = imresize(O0_7,16,'bicubic');
O0_47i = imresize(O0_7, 8,'bicubic'); O0_48i = imresize(O0_8,16,'bicubic');

O45_25i=imresize(O45_5, 8,'bicubic'); O45_26i=imresize(O45_6,16,'bicubic');
O45_36i=imresize(O45_6, 8,'bicubic'); O45_37i=imresize(O45_7,16,'bicubic');
O45_47i=imresize(O45_7, 8,'bicubic'); O45_48i=imresize(O45_8,16,'bicubic');

O90_25i=imresize(O90_5, 8,'bicubic'); O90_26i=imresize(O90_6,16,'bicubic');
O90_36i=imresize(O90_6, 8,'bicubic'); O90_37i=imresize(O90_7,16,'bicubic');
O90_47i=imresize(O90_7, 8,'bicubic'); O90_48i=imresize(O90_8,16,'bicubic');

O135_25i=imresize(O135_5, 8,'bicubic');O135_26i=imresize(O135_6,16,'bicubic');
O135_36i=imresize(O135_6, 8,'bicubic');O135_37i=imresize(O135_7,16,'bicubic');
O135_47i=imresize(O135_7, 8,'bicubic');O135_48i=imresize(O135_8,16,'bicubic');

O0_25 = abs(O0_2-O0_25i); O0_26 = abs(O0_2-O0_26i);
O0_36 = abs(O0_3-O0_36i); O0_37 = abs(O0_3-O0_37i);
O0_47 = abs(O0_4-O0_47i); O0_48 = abs(O0_4-O0_48i);

O45_25 = abs(O45_2-O45_25i); O45_26 = abs(O45_2-O45_26i);
O45_36 = abs(O45_3-O45_36i); O45_37 = abs(O45_3-O45_37i);
O45_47 = abs(O45_4-O45_47i); O45_48 = abs(O45_4-O45_48i);

O90_25 = abs(O90_2-O90_25i); O90_26 = abs(O90_2-O90_26i);
O90_36 = abs(O90_3-O90_36i); O90_37 = abs(O90_3-O90_37i);
O90_47 = abs(O90_4-O90_47i); O90_48 = abs(O90_4-O90_48i);

O135_25 = abs(O135_2-O135_25i); O135_26 = abs(O135_2-O135_26i);
O135_36 = abs(O135_3-O135_36i); O135_37 = abs(O135_3-O135_37i);
O135_47 = abs(O135_4-O135_47i); O135_48 = abs(O135_4-O135_48i);

figure
subplot(2,3,1); imshow(uint8(stand(O0_25)))
subplot(2,3,2); imshow(uint8(stand(O0_26)))
subplot(2,3,3); imshow(uint8(stand(O0_36)))
subplot(2,3,4); imshow(uint8(stand(O0_37)))
subplot(2,3,5); imshow(uint8(stand(O0_47)))
subplot(2,3,6); imshow(uint8(stand(O0_48)))
set(gcf,'numbertitle','off','name','Caracteristica de orientacion 0°')

figure
subplot(2,3,1); imshow(uint8(stand(O45_25)))
subplot(2,3,2); imshow(uint8(stand(O45_26)))
subplot(2,3,3); imshow(uint8(stand(O45_36)))
subplot(2,3,4); imshow(uint8(stand(O45_37)))
subplot(2,3,5); imshow(uint8(stand(O45_47)))
subplot(2,3,6); imshow(uint8(stand(O45_48)))
set(gcf,'numbertitle','off','name','Caracteristica de orientacion 45°')

figure
subplot(2,3,1); imshow(uint8(stand(O90_25)))
subplot(2,3,2); imshow(uint8(stand(O90_26)))
subplot(2,3,3); imshow(uint8(stand(O90_36)))
subplot(2,3,4); imshow(uint8(stand(O90_37)))
subplot(2,3,5); imshow(uint8(stand(O90_47)))
subplot(2,3,6); imshow(uint8(stand(O90_48)))
set(gcf,'numbertitle','off','name','Caracteristica de orientacion 90°')

figure
subplot(2,3,1); imshow(uint8(stand(O135_25)))
subplot(2,3,2); imshow(uint8(stand(O135_26)))
subplot(2,3,3); imshow(uint8(stand(O135_36)))
subplot(2,3,4); imshow(uint8(stand(O135_37)))
subplot(2,3,5); imshow(uint8(stand(O135_47)))
subplot(2,3,6); imshow(uint8(stand(O135_48)))
set(gcf,'numbertitle','off','name','Caracteristica de orientacion 135°')

% Mapa de Orientacion
O0_36r = imresize(O0_36,2,'bicubic'); O0_37r = imresize(O0_37,2,'bicubic');
O0_47r = imresize(O0_47,4,'bicubic'); O0_48r = imresize(O0_48,4,'bicubic');

O45_36r=imresize(O45_36,2,'bicubic'); O45_37r=imresize(O45_37,2,'bicubic');
O45_47r=imresize(O45_47,4,'bicubic'); O45_48r=imresize(O45_48,4,'bicubic');

O90_36r=imresize(O90_36,2,'bicubic'); O90_37r=imresize(O90_37,2,'bicubic');
O90_47r=imresize(O90_47,4,'bicubic'); O90_48r=imresize(O90_48,4,'bicubic');

O135_36r=imresize(O135_36,2,'bicubic');O135_37r=imresize(O135_37,2,'bicubic');
O135_47r=imresize(O135_47,4,'bicubic');O135_48r=imresize(O135_48,4,'bicubic');

Omap =   O0_25 +  O0_26 +  O0_36r +  O0_37r +  O0_47r +  O0_48r + ...
        O45_25 + O45_26 + O45_36r + O45_37r + O45_47r + O45_48r + ...
        O90_25 + O90_26 + O90_36r + O90_37r + O90_47r + O90_48r + ...
       O135_25 +O135_26 +O135_36r +O135_37r +O135_47r +O135_48r;
Omap = Omap./norm(Omap);

%% Resultado
figure
subplot(1,3,1); imshow(uint8(stand(Imap)))
subplot(1,3,2); imshow(uint8(stand(Cmap)))
subplot(1,3,3); imshow(uint8(stand(Omap)))
set(gcf,'numbertitle','off','name','Mapas de Caracteristicas')

S = (Imap + Cmap + Omap)/3;
[m n] = size(S);

figure
imshow(uint8(255*ones(m,n)-stand(S)))

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

% R = r - (g+b)/2;
% G = g - (b+r)/2;
% B = b - (r+g)/2;
% Y = (r+g)/2-abs(r-g)/2-b;



figure
subplot(2,2,1); imshow(uint8(R))
subplot(2,2,2); imshow(uint8(G))
subplot(2,2,3); imshow(uint8(B))
subplot(2,2,4); imshow(uint8(Y))
