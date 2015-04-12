function diff = doubleOpponent(C0)
%% doubleOpponent
%    C0: Imagen de entrada
%  diff: Diferencia centro-al rededor. Color doble oponente

method = 'bilinear';

% Piramide Gaussiana
C1 = impyramid (C0, 'reduce');  C2 = impyramid (C1, 'reduce');
C3 = impyramid (C2, 'reduce');  C4 = impyramid (C3, 'reduce');
C5 = impyramid (C4, 'reduce');  C6 = impyramid (C5, 'reduce');
C7 = impyramid (C6, 'reduce');  C8 = impyramid (C7, 'reduce');

% Interpolacion
C25i = imresize(-C5, 8,method); C26i = imresize(-C6,16,method);
C36i = imresize(-C6, 8,method); C37i = imresize(-C7,16,method);
C47i = imresize(-C7, 8,method); C48i = imresize(-C8,16,method);

% Diferencia
C25 = abs(C2 - C25i); C26 = abs(C2 - C26i);
C36 = abs(C3 - C36i); C37 = abs(C3 - C37i);
C47 = abs(C4 - C47i); C48 = abs(C4 - C48i);

% Escalado
diff(:,:,1) =          C25          ; diff(:,:,2) =          C26          ;
diff(:,:,3) = imresize(C36,2,method); diff(:,:,4) = imresize(C37,2,method);
diff(:,:,5) = imresize(C47,4,method); diff(:,:,6) = imresize(C48,4,method);
end

