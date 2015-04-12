function normW = normalizeWeights(w)
%% normalizeWeights
%      w: Pesos relativos de atención del objeto
%  normW: Pesos relativos normalizados
normW = w/sum(w);
end

