function Ip = piramGauss(I0)
% Ix = piramGaussJ(I0); Ip(:,:,1) = Ix;
% Ix = piramGaussJ(Ix); Ip(:,:,2) = Ix;
% Ix = piramGaussJ(Ix); Ip(:,:,3) = Ix;
% Ix = piramGaussJ(Ix); Ip(:,:,4) = Ix;
% Ix = piramGaussJ(Ix); Ip(:,:,5) = Ix;
% Ix = piramGaussJ(Ix); Ip(:,:,6) = Ix;
% Ix = piramGaussJ(Ix); Ip(:,:,7) = Ix;
% Ix = piramGaussJ(Ix); Ip(:,:,8) = Ix;

% Ip(:,:,2) = piramGaussJ(Ip(:,:,1)); 
% Ip(:,:,3) = piramGaussJ(Ip(:,:,2)); Ip(4) = piramGaussJ(Ip(:,:,3)); 
% Ip(:,:,5) = piramGaussJ(Ip(:,:,4)); Ip(6) = piramGaussJ(Ip(:,:,5)); 
% Ip(:,:,7) = piramGaussJ(Ip(:,:,6)); Ip(8) = piramGaussJ(Ip(:,:,7));
end