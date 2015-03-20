function sm = saliencyMap(img,sigx,sigy)
%% saliencyMap 
%   img: imagen RGB de entrada
%  sigx: variable sigma x del filtro de Gabbor
%  sigy: variable sigma y del filtro de Gabbor
%    sm: Mapa de provinencia

r = double(img(:,:,1));  g = double(img(:,:,2));  b = double(img(:,:,3));

% Característica de intensidad 
I0 = (r+g+b)/3;
dI = centerSurroundDiff(I0);

Imap = normalize(dI(:,:,1)) + normalize(dI(:,:,2)) + ...
       normalize(dI(:,:,3)) + normalize(dI(:,:,4)) + ...
       normalize(dI(:,:,5)) + normalize(dI(:,:,6));

% Caracteristica de orientacion


% Caracteristica de color
R = r - (g+b)/2;  G = g - (b+r)/2;  B = b - (r+g)/2;
Y = (r+g)/2 - abs(r-g)/2 - b;

R = R.*(R>0);  G = G.*(G>0);  B = B.*(B>0);  Y = Y.*(Y>0);

dRG = doubleOpponent(  R-G  );
dBY = doubleOpponent(  B-Y  );
dRC = doubleOpponent(R+Y-G-B);
dGM = doubleOpponent(G+Y-R-B);

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
end

