function [SM,Imap,Cmap,Omap] = saliencyMap(img)
%% saliencyMap 
%   img: imagen RGB de entrada
%  sigx: variable sigma x del filtro de Gabbor
%  sigy: variable sigma y del filtro de Gabbor
%    sm: Mapa de provinencia
%  Imap: Mapa de intensidad
%  Cmap: Mapa de color
%  Omap: Mapa de orientacion

r = double(img(:,:,1));  g = double(img(:,:,2));  b = double(img(:,:,3));

% Característica de intensidad 
I0 = (r+g+b)/3;
[I1 I2 I3 I4 I5 I6 I7 I8] = pyrGauss(I0);
dI = centerSurroundDiff(I2,I3,I4,I5,I6,I7,I8);

Imap = nrm(dI(:,:,1)) + nrm(dI(:,:,2)) + nrm(dI(:,:,3)) + ...
       nrm(dI(:,:,4)) + nrm(dI(:,:,5)) + nrm(dI(:,:,6));

% Caracteristica de orientacion
[P2 P3 P4 P5 P6 P7 P8] = pyrGabbor(I2,I3,I4,I5,I6,I7,I8,     0);
dO0  = centerSurroundDiff(P2,P3,P4,P5,P6,P7,P8);

[P2 P3 P4 P5 P6 P7 P8] = pyrGabbor(I2,I3,I4,I5,I6,I7,I8,  pi/4);
dO45 = centerSurroundDiff(P2,P3,P4,P5,P6,P7,P8);

[P2 P3 P4 P5 P6 P7 P8] = pyrGabbor(I2,I3,I4,I5,I6,I7,I8,  pi/2); 
dO90 = centerSurroundDiff(P2,P3,P4,P5,P6,P7,P8);

[P2 P3 P4 P5 P6 P7 P8] = pyrGabbor(I2,I3,I4,I5,I6,I7,I8,3*pi/4);
dO135 = centerSurroundDiff(P2,P3,P4,P5,P6,P7,P8);

O0map = nrm(dO0(:,:,1)) + nrm(dO0(:,:,2)) + nrm(dO0(:,:,3)) + ...
        nrm(dO0(:,:,4)) + nrm(dO0(:,:,5)) + nrm(dO0(:,:,6));

O45map = nrm(dO45(:,:,1)) + nrm(dO45(:,:,2)) + nrm(dO45(:,:,3)) + ...
         nrm(dO45(:,:,4)) + nrm(dO45(:,:,5)) + nrm(dO45(:,:,6));

O90map = nrm(dO90(:,:,1)) + nrm(dO90(:,:,2)) + nrm(dO90(:,:,3)) + ...
         nrm(dO90(:,:,4)) + nrm(dO90(:,:,5)) + nrm(dO90(:,:,6));

O135map = nrm(dO135(:,:,1)) + nrm(dO135(:,:,2)) + nrm(dO135(:,:,3)) + ...
          nrm(dO135(:,:,4)) + nrm(dO135(:,:,5)) + nrm(dO135(:,:,6));
      
Omap = nrm(O0map ) + nrm(O45map ) + nrm(O90map) + nrm(O135map);
   
% Caracteristica de color
R = r - (g+b)/2;  G = g - (b+r)/2;  B = b - (r+g)/2;
Y = (r+g)/2 - abs(r-g)/2 - b;

R = R.*(R>0);  G = G.*(G>0);  B = B.*(B>0);  Y = Y.*(Y>0);

dRG = doubleOpponent(  R-G  );
dBY = doubleOpponent(  B-Y  );
dRC = doubleOpponent(R+Y-G-B);
dGM = doubleOpponent(G+Y-R-B);

RGmap = nrm(dRG(:,:,1)) + nrm(dRG(:,:,2)) + nrm(dRG(:,:,3)) + ...
        nrm(dRG(:,:,4)) + nrm(dRG(:,:,5)) + nrm(dRG(:,:,6));

BYmap = nrm(dBY(:,:,1)) + nrm(dBY(:,:,2)) + nrm(dBY(:,:,3)) + ...
        nrm(dBY(:,:,4)) + nrm(dBY(:,:,5)) + nrm(dBY(:,:,6));
    
RCmap = nrm(dRC(:,:,1)) + nrm(dRC(:,:,2)) + nrm(dRC(:,:,3)) + ...
        nrm(dRC(:,:,4)) + nrm(dRC(:,:,5)) + nrm(dRC(:,:,6));

GMmap = nrm(dGM(:,:,1)) + nrm(dGM(:,:,2)) + nrm(dGM(:,:,3)) + ...
        nrm(dGM(:,:,4)) + nrm(dGM(:,:,5)) + nrm(dGM(:,:,6));
    
Cmap = RGmap + BYmap + RCmap + GMmap;

% Resultado
SM = (Imap + Cmap + Omap)/3;
end