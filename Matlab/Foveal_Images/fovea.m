function imagenFoveal = fovea(imagenEntrada, rect)
%% fovea
%   imagenEntrada : Imagen de entrada [f,c,3]
%   rect          : Zona de atencion de la imagen [fsi csi fid cid]
%
%   |(fsi,csi)            |
%   |                     |
%   |            (fid,cid)|

imagenFoveal = decResol(imagenEntrada);
fsi = rect(1); csi = rect(2); fid = rect(3); cid = rect(4);

imagenFoveal(fsi:fid,csi:cid,1) = imagenEntrada(fsi:fid,csi:cid,1);
imagenFoveal(fsi:fid,csi:cid,2) = imagenEntrada(fsi:fid,csi:cid,2);
imagenFoveal(fsi:fid,csi:cid,3) = imagenEntrada(fsi:fid,csi:cid,3);

end