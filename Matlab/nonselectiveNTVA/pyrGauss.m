function [I1 I2 I3 I4 I5 I6 I7 I8] = pyrGauss(I0)
%% pyrGauss
%    I0     : Imagen de entrada
%   pyrGauss: Piramide de Gauss

I1 = impyramid (I0, 'reduce');  I2 = impyramid (I1, 'reduce');
I3 = impyramid (I2, 'reduce');  I4 = impyramid (I3, 'reduce');
I5 = impyramid (I4, 'reduce');  I6 = impyramid (I5, 'reduce');
I7 = impyramid (I6, 'reduce');  I8 = impyramid (I7, 'reduce');
end

