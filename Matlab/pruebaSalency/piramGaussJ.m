function imgOut = piramGaussJ(imgIn)
[rows cols] = size(imgIn);

a = 2;
for i=1:rows
    aux2(i+a,     1:a     ) = imgIn(i,  a:-1:1      );
    aux2(i+a,cols+1:cols+a) = imgIn(i,end:-1:end-a+1);
end

for j=1:cols
    aux2(     1:a,     j+a) = imgIn(  a:-1:1,      j);
    aux2(rows+1:rows+a,j+a) = imgIn(end:-1:end-a+1,j);
end
aux2(a+1:rows+a,a+1:cols+a) = imgIn(:,:);

w = fspecial('gaussian',[5 5],0.5);

aux2 = convn(aux2,w,'same');
aux  = aux2(a+1:rows+a,a+1:cols+a);
imgOut = aux(1:2:end, 1:2:end);
end