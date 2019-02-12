function uf_out = RungeKutta2 (uf, h, g0, Psatf,del, gam, K)
  k1 = 0.5 * h * gKu_Nu(uf, g0, Psatf, del, gam, K);
  k2 = h * gKu_Nu(uf + k1, g0,Psatf, del, gam, K);
  uf_out =  uf + k2;
end