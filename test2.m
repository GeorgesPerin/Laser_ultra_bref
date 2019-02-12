
 [t,u1,uplot]=Mod_lock_actif();
 figure
 hold on
 plot(t*10^(12),uplot(1,:),'ko')
 plot(t*10^(12),uplot(end,:),'-rs');
 plot(t*10^(12),u1,'x--b')
 grid on
 set(gca,'fontsize',15)
 box on
 legend('impulsion initiale','impulsion modelisee','impulsion theorique')
 xlabel('Temps (ps)')
 ylabel('Champ (V.m^{-1})')