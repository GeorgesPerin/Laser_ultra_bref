close all
 [t,u1,uplot]=Mod_lock_actif();
 close
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
 title('Blocage de mode actif')
 
 figure
 [~,Upas]=hme_ssfm2();
 close
 figure 
 hold on
 plot(t*10^(12),Upas(1,:),'bo')
 plot(t*10^(12),Upas(end,:),'-rs');
 grid on
 set(gca,'fontsize',15)
 box on
 legend('impulsion initiale','impulsion modelisee')
 xlabel('Temps (ps)')
 ylabel('Champ (V.m^{-1})')
 title('Blocage de mode passif')
 