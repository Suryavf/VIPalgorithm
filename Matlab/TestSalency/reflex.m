function outImg = reflex(inImg)
%% reflex
%   inImg: imagen de entrada
%  outImg: imagen de salida

[rows cols ~] = size(inImg);
nRows = cel( 2^(log2(rows)) );
nCols = cel( 2^(log2(cols)) );

dRows = (nRows-rows)/2;
dCols = (nCols-cols)/2;

outImg = zeros(nRows,nCols);
outImg(dRows+1:dRows+rows, dCols+1:dCols+cols, :)=inImg(:,:,:);

outImg(           1:dRows,dCols+1:dCols+cols)=inImg(       dRows:-1:1   ,:,:);
outImg(dRows+rows+1:nRows,dCols+1:dCols+cols)=inImg(rows-dRows+1:-1:rows,:,:);


end

