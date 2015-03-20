function outImg = reflex(inImg)
%% reflex
%   inImg: imagen de entrada
%  outImg: imagen de salida

[rows cols ~] = size(inImg);
nRows = 2^( ceil(log2(rows)) );
nCols = 2^( ceil(log2(cols)) );

dRows = (nRows-rows)/2;
dCols = (nCols-cols)/2;

outImg(:,:,:) = zeros(nRows,nCols,3);

outImg(dRows+1:dRows+rows, dCols+1:dCols+cols, :)=inImg(:,:,:);

outImg(           1:dRows,dCols+1:dCols+cols,:)=inImg(dRows:-1:1   ,:,:);
outImg(dRows+rows+1:nRows,dCols+1:dCols+cols,:)=inImg( rows:-1:rows-dRows+1,:,:);

outImg(dRows+1:dRows+rows,           1:dCols,:)=inImg(:,dCols:-1:1   ,:);
outImg(dRows+1:dRows+rows,dCols+cols+1:nCols,:)=inImg(:, cols:-1:cols-dCols+1,:);

end

