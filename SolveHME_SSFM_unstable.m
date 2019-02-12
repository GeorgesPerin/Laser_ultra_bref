function [t,uplot]=SolveHME_SSFM_unstable()
  % The equation parameters
  g0 = 0.4; PsatTR = 1; loss = 0.2;
  Omega = sqrt(10); del = 0.03;
  gam = 4; beta2 = -2;
  % Discretization
  Nt = 1024; T = 50; dt = T/Nt;
  t = (-Nt/2:1:Nt/2 - 1)' *  dt;
  dw = 2 * pi/T; w = [[0:Nt/2-1] 0 [-Nt/2+1: -1 ]]' * dw;
  Z = 500; h = 0.04; NumSteps = round(Z/h);
  SaveInterval = 250;
  % Operators
  L = (1i * beta2 * w.^2 - loss)/2;
  K = (1 - (w/Omega).^2)/2;
  % Initial condition
  u0 = 0.25 * exp(-(t/5).^2);
  uf = fft(u0); uplot = u0.'; zplot = 0;
  Psatf = PsatTR/dt * Nt;
  for istep = 1:NumSteps
    uf = exp(L * h/2).* uf;
    uf = RungeKutta2(uf, h, g0, Psatf, del, gam, K);
    uf = exp(L * h/2).* uf;
    if any(isnan(uf))
      break;
    end
    if mod(istep, SaveInterval) == 0
      uplot = [uplot; ifft(uf).'];
      zplot = [zplot, istep* h];
    end
  end
  waterfall(t, zplot, abs(uplot));
  colormap([0 0 0]); view(30, 30);
  xlabel('t'); ylabel('z'); axis tight;
end