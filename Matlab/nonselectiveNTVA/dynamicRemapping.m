function [win,winners] = dynamicRemapping(w,id)
%% dynamicRemapping
%        w: Pesos de atencion 
%       id: Indices de los objetos
%      win: Indice del objeto ganador
%  winners: Arbol de ganadores

% V2/V3 -> V4
[winWeight(1,1),winners(1,1)] = WTA(w(1,2),id(1,2));
[winWeight(2,1),winners(2,1)] = WTA(w(3,4),id(3,4));
[winWeight(3,1),winners(3,1)] = WTA(w(5,6),id(5,6));

% V4 -> IT
[winWeight(1,2),win] = WTA(winWeight(1:3,1),winners(1:3,1));
end