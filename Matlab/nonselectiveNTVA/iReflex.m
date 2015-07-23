function imgOut = iReflex(exImg,sizeImg)
%% iReflex
%    exImg: Imagen extendida (entrada)
%  sizeImg: Tamaño de la imagen de salida
%      img: Imagen resultado

[nRows nCols ~] = size(exImg);
rows = sizeImg(1);   cols = sizeImg(2);

dRows = ceil((nRows-rows)/2);
dCols = ceil((nCols-cols)/2);

imgOut(:,:,:) = exImg(dRows+1:dRows+rows, dCols+1:dCols+cols, :);
end

