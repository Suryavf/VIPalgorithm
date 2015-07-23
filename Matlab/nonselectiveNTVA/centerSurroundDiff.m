function diff = centerSurroundDiff(I2,I3,I4,I5,I6,I7,I8)
%% centerSurroundDiff
%    I0: Imagen de entrada
%  diff: Diferencia centro-alrededor

method = 'bilinear';

% Interpolacion
I25i = imresize(I5, 8,method); I26i = imresize(I6,16,method);
I36i = imresize(I6, 8,method); I37i = imresize(I7,16,method);
I47i = imresize(I7, 8,method); I48i = imresize(I8,16,method);

% Diferencia
I25 = abs(I2 - I25i); I26 = abs(I2 - I26i);
I36 = abs(I3 - I36i); I37 = abs(I3 - I37i);
I47 = abs(I4 - I47i); I48 = abs(I4 - I48i);

% Escalado
diff(:,:,1) =          I25          ; diff(:,:,2) =          I26          ;
diff(:,:,3) = imresize(I36,2,method); diff(:,:,4) = imresize(I37,2,method);
diff(:,:,5) = imresize(I47,4,method); diff(:,:,6) = imresize(I48,4,method);
end

