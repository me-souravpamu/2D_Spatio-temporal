%plot%
figure;
x=load('data_timestep_kp_0.12_mu_0.60_Du_0.01_500000.dat');
u = x(:,1);
v = x(:,2);
z = x(:,3);
m=200 ,n=200;
colormap jet
surface(reshape(u,m,[]),reshape(v,m,[]),reshape(z,m,[]))
shading interp
axis tight
set(gca,'linewidth',2,'Fontsize',20)
