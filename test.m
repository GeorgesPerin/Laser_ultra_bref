close all 
clear all

[~,Upas]=hme_ssfm2();
[t,Uact]=Mod_lock_actif();
U1=abs(Upas(end,:)).^2;
U2=abs(Uact(end,:)).^2;
plot(t,U1)
hold on
plot(t,U2,'-r')
legend('SSF classque')
xlabel('temps')
ylabel('Puissance')

fid = fopen('test.txt','w');
fprintf(fid,'%f %f',t);
fprintf(fid,'\n');
fprintf(fid,'%f %f',U1);
fprintf(fid,'\n');
fprintf(fid,'%f %f',U2);
fclose(fid)