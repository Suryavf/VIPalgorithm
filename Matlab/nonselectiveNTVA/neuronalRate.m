function v = neuronalRate(n,beta,w)
%% neuronalRate
%     v: Activacion total de las neuronas para una categoria y objeto
%     n: Fuerza de evidencia sensorial
%  beta: Bias. Sesgo de categoria
%     w: Pesos relativos de atención del objeto
[numObj,numFn]=size(n);
v = zeros(numObj,numFn);

for x=1:numObj
    for i=1:numFn
        v(x,i)=n(x,i)*beta(i)*w(x);
    end
end

end

