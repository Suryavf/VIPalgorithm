function outImg = reflex(inImg,sizeImg)
%% reflex
%    inImg: imagen de entrada
%  sizeImg: tamaño de la imagen (dataset)
%   outImg: imagen de salida

rows = sizeImg(2); cols = sizeImg(1);
nRows = 2^( ceil(log2(rows)) );
nCols = 2^( ceil(log2(cols)) );

if(rem(rows,2)==0)
    dRows = (nRows-rows)/2;
else
    dRows = (nRows-rows-1)/2;
end

if(rem(cols,2)==0)
    dCols = (nCols-cols)/2;
else
    dCols = (nCols-cols-1)/2;   
end

outImg(:,:,:) = zeros(nRows,nCols,3);
outImg(dRows+1:dRows+rows, dCols+1:dCols+cols, :)=inImg(1:rows,1:cols,:);

outImg(           1:dRows,dCols+1:dCols+cols,:)=inImg(dRows:-1:1           ,1:cols,:);
outImg(dRows+rows+1:nRows,dCols+1:dCols+cols,:)=inImg( rows:-1:rows-dRows+1,1:cols,:);

outImg(dRows+1:dRows+rows,           1:dCols,:)=inImg(1:rows,dCols:-1:1           ,:);
outImg(dRows+1:dRows+rows,dCols+cols+1:nCols,:)=inImg(1:rows, cols:-1:cols-dCols+1,:);

end

