function imgOut = filterGabor(imgIn,sigX,sigY,f0,phi,sizeW)
[rows cols ~] = size(imgIn);

% Preparacion de la imagen
a = (39-1)/2;
for i=1:rows
    aux2(i+a,     1:a     ) = imgIn(i,  a:-1:1      );
    aux2(i+a,cols+1:cols+a) = imgIn(i,end:-1:end-a+1);
end

for j=1:cols
    aux2(     1:a,     j+a) = imgIn(  a:-1:1,      j);
    aux2(rows+1:rows+a,j+a) = imgIn(end:-1:end-a+1,j);
end
aux2(a+1:rows+a,a+1:cols+a) = imgIn(:,:);

% Filtro Gabor
w = fnGbr(sigX,sigY,f0,phi,sizeW);

aux2 = convn(aux2,w,'same');
imgOut  = aux2(a+1:rows+a,a+1:cols+a);
end