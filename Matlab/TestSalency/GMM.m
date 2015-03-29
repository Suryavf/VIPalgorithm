function binImg = GMM( sm )
%% GMM
%      sm: Saliency Map
%  binImg: Imagen binaria de salida
I=double(sm);
umbral = 140;
Isegmentada = I;

[nf,nc] = size(I);
for f = 1:nf
    for c = 1:nc
        if I(f,c)>umbral
            Isegmentada(f,c) = 255;
        else
            Isegmentada(f,c) = 0;
        end
    end
end

Isegmentada=uint8(Isegmentada);

B=[0 1 0;1 1 1; 0 1 0];
f=1;
while f < nf
    c = 1;
    while c < nc
        if Isegmentada(f,c) == 255
            ff=f;
            cc=c;
            f=nf;
            c=nc;
        end
        c = c+1;
    end
    f = f+1;
end

IMc = 1 - Isegmentada;
IMc=double(IMc);
X = zeros(nf,nc);
X(ff,cc)=1;
Xold = X;
while (1)
    X=double(imdilate(X,B));
    X=X.*IMc;
    if Xold == X
        break;
    end;
    Xold=X;
end;

binImg = X;

end

