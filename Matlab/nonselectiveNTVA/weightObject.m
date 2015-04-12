function w = weightObject(n,PI)
%% weightObject
%   w: Peso relativo de atención del objeto
%   n: Fuerza de evidencia sensorial
%  PI: Pertinencia de la funcion visual
[numObj,numFn]=size(n);
w = zeros(1,numObj);

for x=1:numObj
    for j=1:numFn
        w(x)=w(x)+n(x,j)*PI(j);
    end
end

end

