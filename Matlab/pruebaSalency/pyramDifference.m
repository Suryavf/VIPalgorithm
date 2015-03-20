function dI = pyramDifference(I0)
metInt = 'bilinear';

I1 = piramGaussJ(I0);
I2 = piramGaussJ(I1);
I3 = piramGaussJ(I2);
I4 = piramGaussJ(I3);
I5 = piramGaussJ(I4);
I6 = piramGaussJ(I5);
I7 = piramGaussJ(I6);
I8 = piramGaussJ(I7);

I25i = imresize(I5, 8,metInt); I26i = imresize(I6,16,metInt);
I36i = imresize(I6, 8,metInt); I37i = imresize(I7,16,metInt);
I47i = imresize(I7, 8,metInt); I48i = imresize(I8,16,metInt);

I25 = abs(I2 - I25i); I26 = abs(I2 - I26i);
I36 = abs(I3 - I36i); I37 = abs(I3 - I37i);
I47 = abs(I4 - I47i); I48 = abs(I4 - I48i);

dI(:,:,1) = imresize(I25,2,metInt); dI(:,:,2) = imresize(I26,2,metInt);
dI(:,:,3) = imresize(I36,4,metInt); dI(:,:,4) = imresize(I37,4,metInt);
dI(:,:,5) = imresize(I47,8,metInt); dI(:,:,6) = imresize(I48,8,metInt);
end

