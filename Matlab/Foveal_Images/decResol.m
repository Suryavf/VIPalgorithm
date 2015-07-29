function imgLowResol = decResol(imagenEntrada)
%% decResol
%   Función que reduce la resolución de una imagen
%   imagenEntrada : imagen [f,c,3]
%   imLowResol    : imagen con baja resolucion [f,c,3]

I0          = imresize(imagenEntrada,0.2);
I1          = imresize(I0           ,0.2);
I2          = imresize(I1           ,5  );
imgLowResol = imresize(I2           ,5  );


end

