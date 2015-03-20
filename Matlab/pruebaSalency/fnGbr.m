function w = fnGbr(sigX,sigY,f0,phi,sizeW)
% Filtro Gabor
%sigX = 2;
%sigY = 2;
%f0 = 2;

w=zeros(sizeW,sizeW);
rt = (sizeW-1)/2;
for x=-rt:rt
    for y=-rt:rt
        xp = x*cos(phi) + y*sin(phi);
        yp =-x*sin(phi) + y*cos(phi);
        
        gauss = exp(-1/2*( (xp/sigX)^2 + (yp/sigY)^2) );
        w(x+rt+1,y+rt+1) = gauss*cos(2*pi*f0*xp);
    end
end

end


% w = ...
% [fnGbr(-2, 2,phi) fnGbr(-1, 2,phi) fnGbr(0, 2,phi) fnGbr(1, 2,phi) fnGbr(2, 2,phi);...
%  fnGbr(-2, 1,phi) fnGbr(-1, 1,phi) fnGbr(0, 1,phi) fnGbr(1, 1,phi) fnGbr(2, 1,phi);...
%  fnGbr(-2, 0,phi) fnGbr(-1, 0,phi) fnGbr(0, 0,phi) fnGbr(1, 0,phi) fnGbr(2, 0,phi);...
%  fnGbr(-2,-1,phi) fnGbr(-1,-1,phi) fnGbr(0,-1,phi) fnGbr(1,-1,phi) fnGbr(2,-1,phi);...
%  fnGbr(-2,-2,phi) fnGbr(-1,-2,phi) fnGbr(0,-2,phi) fnGbr(1,-2,phi) fnGbr(2,-2,phi)];
