function rect = sqr( binImg )
%% sqr
%  binImg: Imagen binaria de entrada
%    rect: Extemos opuestos del rectangulo

[rows,cols]=size(binImg);
 left   = cols;
 top    = rows;
 right  = 0;
 bottom = 0;


for i=1:rows
    for j=1:cols
        if binImg(i,j)==1
            if (j<  left); left   = j; end % izquierda
            if (j> right); right  = j; end % derecha
            if (i<   top); top    = i; end % arriba
            if (i>bottom); bottom = i; end % abajo
        end;
    end;
end;

rect = [left top right bottom];
end

