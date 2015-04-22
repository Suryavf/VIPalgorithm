function [wT,idW] = WTA(w,id)
%% WTA
%    w: Pesos que compiten
%   id: Indices de los objetos
%   wT: suma de pesos
%  idW: Indice del ganador
wT = sum(w);
r  = rand();

x    = 1;
wsum = w(x)/wT;

while(wsum>r)
    x    = x+1;
    wsum = wsum + (x)/wT;
end

idW = id(x);
end

