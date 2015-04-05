function outImg = check(inImg,sizeImg)
%% check
%    inImg: imagen de entrada a revisar
%  sizeImg: tamaño deseado de la imagen
%   outImg: imagen de salida revisada y corregida
[rows cols ~] = size(inImg);
nrow = sizeImg(2);
ncol = sizeImg(1);

if(rows==nrow && cols==ncol)
    outImg = inImg;
else
    outImg(:,:,:) = inImg(1:nrow,1:ncol,:);
end

end

