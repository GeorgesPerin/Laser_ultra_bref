close all 

% [~,Upas]=hme_ssfm2();
% [t,~,Uact]=Mod_lock_actif();
% U1=(Upas(end,:));
% U2=(Uact(end,:));
plot(t,abs(U1).^2)
hold on
plot(t,abs(U2).^2,'-r')
legend('Passif','Actif')
xlabel('temps')
ylabel('Puissance')

% t=t';
% fid = fopen('test.txt','w');
% fprintf(fid,'%f %f',t); 
% fprintf(fid,'\n');
% fprintf(fid,'%f %f',U1);
% fprintf(fid,'\n');
% fprintf(fid,'%f %f',U2);
% fclose(fid)
% 

save('Impulsion.mat','t','U1','U2')