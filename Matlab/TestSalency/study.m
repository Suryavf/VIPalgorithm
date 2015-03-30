function distribution = study(saliency,rectD,sizeImg)
%% study
%      saliency: mapa de saliencia
%         rectD: rectangulo de la posicion de los positivos
%       sizeImg: tamaño de la imagen
%  distribution: distribucion de los positivos y negativos
rows = sizeImg(2);
cols = sizeImg(1);

sm = uint8(saliency);
distribution = zeros(256,2);
numP=0;
numN=0;

for i=1:rows
    for j=1:cols
        if(rectD(1)<i && rectD(3)>i && rectD(2)<j && rectD(4)>j)
            distribution(sm(i,j)+1,1) = distribution(sm(i,j)+1,1) + 1;
            numP = numP+1;
        else
            distribution(sm(i,j)+1,2) = distribution(sm(i,j)+1,2) + 1;
            numN = numN+1;
        end
    end
end

distribution(:,1)=distribution(:,1)/numP;
distribution(:,2)=distribution(:,2)/numN;

end

