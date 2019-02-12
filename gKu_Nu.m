function dudt = gKu_Nu(uf, g0, Psatf, del, gam, K)
  g = g0/(1 + norm(uf)^2/Psatf);
  u = ifft(uf);
  dudt = g * K .* uf + fft((del + 1i * gam) * abs(u).^2 .* u);
end