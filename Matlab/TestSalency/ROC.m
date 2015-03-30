function AUC = ROC(distribution)
%% ROC
%   distribution: 
%            AUC: 
[many ~] = size(distribution);

TP = zeros(1,many);   FP = zeros(1,many);

TP(1) = distribution(1,1);
FP(1) = distribution(1,2);

for i= 2:many
    TP(i) = TP(i-1) + distribution(i,1);
    FP(i) = FP(i-1) + distribution(i,2);
end

TN = 1 - FP;
FN = 1 - TP;

sensibilidad=TP./(TP+FN); f_a=FP./(FP+TN);
plot(f_a, sensibilidad);
axis([0 1 0 1])

AUC=0;
for i=1:many-1
    AUC = AUC + (f_a(i+1)-f_a(i))*sensibilidad(i);
end

end