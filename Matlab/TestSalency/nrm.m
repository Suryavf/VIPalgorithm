function normM = nrm(M)
%%nrm  
normM = M/norm(M);
maxM = max(max(normM));
mavg = mean(mean(normM));
normM = ((maxM-mavg)^2)*normM;
end