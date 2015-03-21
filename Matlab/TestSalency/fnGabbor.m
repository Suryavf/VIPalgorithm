function fn = fnGabbor(x,y,phi)
%% fnGabbor
%   x,y: Posicion
%    fn: Funcion

xp = x*cos(phi) + y*sin(phi);
yp =-x*sin(phi) + y*cos(phi);

k     = 0.71;
gamma = 0.7;
f0    = 1/4;

md = exp(-pi*(k*f0)^2*( xp^2 + gamma*yp^2 ));
fn = md*[cos(2*pi*f0*xp) sin(2*pi*f0*xp)];
end