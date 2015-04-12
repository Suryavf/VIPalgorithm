function [P2 P3 P4 P5 P6 P7 P8] = pyrGabbor(I2,I3,I4,I5,I6,I7,I8,phi)
%% pyrGabbor
%   img: imagen de entrada
%   phi: orientacion
%   pyr: piramide de gabbor

orden  = 6;
filter = filGabbor(orden,phi);

P2 = imfilter(I2,filter);
P3 = imfilter(I3,filter);
P4 = imfilter(I4,filter);
P5 = imfilter(I5,filter);
P6 = imfilter(I6,filter);
P7 = imfilter(I7,filter);
P8 = imfilter(I8,filter);
end