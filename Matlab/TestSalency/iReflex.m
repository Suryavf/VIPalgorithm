function img = iReflex(exImg,sizeImg)
%% iReflex
%    exImg: Imagen extendida (entrada)
%  sizeImg: Tamaño de la imagen de salida
%      img: Imagen resultado

[nRows nCols ~] = size(exImg);
rows = sizeImg(2);   cols = sizeImg(1);

dRows = (nRows-rows)/2;
dCols = (nCols-cols)/2;

img(:,:,:) = exImg(dRows+1:dRows+rows, dCols+1:dCols+cols, :);
end

