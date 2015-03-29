function rect = sqr( binImg )
%% sqr
%  binImg: Imagen binaria de entrada
%    rect: Extemos opuestos del rectangulo

[filasb,columnasb]=size(binImg);
fii=0; % valor inicial fila inferior izquierda
cii=columnasb; % valor inicial columna inferior izquierda
fsd=filasb; % valor inicial fila superior derecha
csd=0; % valor inicial columna superior derecha

for f=1:filasb
    for c=1:columnasb
        if binImg(f,c)==0
            if f>fii && f<297
                fii=f;
            end;
            if c<cii && c<398
                cii=c;
            end;
            if f<fsd && f<298
                fsd=f;
            end;
            if c>csd && c<398
                csd=c;
            end;
        end;
    end;
end;

rect = [fii,cii;fsd,csd]; % la primera fila son las coordenadas 
                          % de la esquina inferior izquierda y 
                          % la 2da fila son las coordenadas de la esquina superior derecha

end

