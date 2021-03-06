function [t,u1,uplot] = Mod_lock_actif()
close all
% The equation parameters

g = 0.8; l = 0.2;
L=0.2;
m=0.01;
c=3*10^8;
T0=1*10^-12;
wm=sqrt(4*(g-l)/(T0^2*m));
Dwg=4/(T0^2*wm)*(sqrt(g/m));
TR=L/c+2*g/(Dwg);


% Discretization
TR=500000*TR;
Nt = 1024; T = 50*10^-12; dt = T/Nt;
t =(-Nt/2: 1 : Nt/2 - 1)'*dt;
dw = 2*pi/T; w = (-Nt/2: 1 : Nt/2 - 1)'*  dw;
Tr =100000*TR; h = TR; NumSteps = round(Tr/h);
SaveInterval= 2500;
% Operateurs


% Initial condition
L=g-l-(m*wm^2/4)*t.^2;
K=-4*g.*(w/Dwg).^2;
u0 = 0.25* exp(-(t/(10*10^-12)).^2);
uf = fftshift(fft(u0)); uplot=abs(u0).';
zplot = 0;
u=u0;
for istep = 1:NumSteps
    
u=ifft(ifftshift(exp(K*TR).* uf));
uf=fftshift(fft(exp(L*TR).*u));



% if any(isnan(uf))
%       break;
% end
    
if mod(istep, SaveInterval) == 0
uplot =[uplot ; abs(ifft(uf)).'];
zplot =[zplot, istep * h];
end

end
waterfall(t, zplot, uplot); colormap([0 0 0]);
view(30, 30); xlabel('t'); ylabel('z');
a=2*(g-l)/(m*wm^2);
u1 = max(uplot(end,:))* exp(-(t).^2/(4*a));
end


