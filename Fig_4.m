fileID1 = fopen('amp.txt', 'w');
% fileID2 = fopen('amp_g1_g2.txt', 'w');
% fileID3 = fopen('amp_roh1.txt', 'w');
% fileID4 = fopen('amp_roh1_stable.txt', 'w');
% fileID5 = fopen('amp_roh3.txt', 'w');
% fileID6 = fopen('amp_roh_3.txt', 'w');

for j = 0:500
eta = -0.2766 +(1.19575/500.0)*j;

gamma = 3.73;
beta = 0.5;
delta = 0.1;
rho = 1.76;
xi = 0.1;
kappa = 0.16;
mu=0.798;
% d1 = 0.01;
d2 = 1.0;

d_c= 0.052;

u = 0.7348;
v = 1.0577;

 f_u = (((rho * ((1/kappa) - (2 * u) - v)) - (kappa * u^2)) / (rho + (kappa * u))^2)- xi - ((gamma * v ) / (u  + 1)^2);

 f_v = -u * ((1 / (rho + (kappa * u))) + (gamma / (u + 1)));

 g_u = -((beta * v) / (u + 1)^2) *((u )^2 + (2 * u) + v  - (1 / kappa));

 g_v = ((((beta * u) ) / (u + 1)) * ((1 / kappa) - u - (2 * v)))- delta - (2 * mu * v);

 k_c_sqr = (f_u + d_c * g_v)/ (2.0 * d_c);

phi = - f_v/(f_u - d_c * k_c_sqr);
shi = - f_v /( g_v - d2 *k_c_sqr);

   f_uu= (2.0*gamma*v)/(u + 1.0)^3 - (2.0*rho + 2.0*kappa*u)/(rho + kappa*u)^2 + (2.0*kappa*(kappa*u^2 + rho*(2.0*u + v - 1/kappa)))/(rho + kappa*u)^3;
   
   f_uv= - rho/(rho + kappa*u)^2 - gamma/(u + 1.0)^2;
   
   f_vv=0.0;
   
   g_uu= (2.0*beta*v*(u^2 + 2.0*u + v - 1/kappa))/(u + 1.0)^3 - (beta*v*(2.0*u + 2.0))/(u + 1.0)^2;
   
   g_uv= - (beta*v)/(u + 1.0)^2 - (beta*(u^2 + 2.0*u + v - 1/kappa))/(u + 1.0)^2;
   
   g_vv= -(2.0*mu)-((2.0*beta*u)/(1.0+u));
   
   f_uuu= (4.0*kappa*(2.0*rho + 2.0*kappa*u))/(rho + kappa*u)^3 - (6.0*kappa^2*(kappa*u^2 + rho*(2.0*u + v - 1/kappa)))/(rho + kappa*u)^4 - (6.0*gamma*v)/(u + 1.0)^4 - (2*kappa)/(rho + kappa*u)^2;
   
   f_uuv= (2.0*gamma)/(u + 1.0)^3 + (2.0*kappa*rho)/(rho + kappa*u)^3;
   
   f_uvv=0.0;
   
   f_vvv=0.0;
   
   g_uuu= (4.0*beta*v*(2.0*u + 2.0))/(u + 1.0)^3 - (6.0*beta*v*(u^2 + 2.0*u + v - 1/kappa))/(u + 1.0)^4 - (2.0*beta*v)/(u + 1.0)^2;
   
   g_uuv=-beta*(2.0+2.0*u)/((1+u)^2)+((2.0*beta*v)/((1.0+u)^3))+((2.0*beta*(-1.0+kappa*(2.0*u+u*u+v)))/(kappa*((1.0+u)^3)));
   
   g_uvv= -2.0*beta/((1.0+u)^2);
   
   g_vvv=0.0;


   u00 = (g_v *(- f_uu * phi^2 - 2.0 * f_uv *phi - f_vv)+ f_v*(g_uu * phi^2 + 2.0 * g_uv * phi + g_vv))/(f_u*g_v - f_v * g_u);
   v00 = (f_u * (- g_uu *phi^2 - 2.0 * g_uv * phi - g_vv)+ g_u * ( f_uu * phi^2 + 2.0 * f_uv * phi + f_vv ))/(f_u*g_v - f_v * g_u);

   u11 = ((-0.5 * f_uu * phi^2 - f_uv * phi - 0.5 * f_vv)*(g_v - 4.0 * d2 * k_c_sqr)- ((- 0.5 * g_uu * phi^2 - g_uv*phi - 0.5 * g_vv)* f_v))/((f_u - 4.0 * d_c* k_c_sqr)*(g_v - 4.0 * d2 * k_c_sqr)- f_v*g_u);
   v11= ((- 0.5 * g_uu * phi^2 - g_uv * phi - 0.5 * g_vv)*(f_u - 4.0 * d_c *k_c_sqr)- ((-0.5 * f_uu *phi^2 - f_uv *phi - 0.5 * f_vv)* g_u))/((f_u - 4.0 * d_c * k_c_sqr)*(g_v - 4.0 * d2 * k_c_sqr)- f_v*g_u);

u_star= (( g_v - 3.0 *d2 *k_c_sqr)*(- f_uu * phi^2 - 2.0 * f_uv*phi - f_vv)- f_v*(- g_uu * phi^2 -2.0 * g_uv * phi - g_vv))/((f_u - 3.0 * k_c_sqr*d_c )*(g_v - 3.0 *d2 *k_c_sqr)- f_v*g_u);
v_star= (( f_u - 3.0 *d_c *k_c_sqr)*(- g_uu * phi^2 - 2.0* g_uv * phi - g_vv)- g_u*(- f_uu * phi^2 - 2.0 * f_uv * phi - f_vv))/((f_u - 3.0 *d_c * k_c_sqr )*(g_v - 3.0 *d2 *k_c_sqr)- f_v*g_u);

  
F_1 = -(phi*u00*f_uu+ phi * u11 *f_uu + phi * v00 *f_uv + phi * v11 * f_uv + u11* f_uv + v11 * f_vv + v00 * f_vv + u00 * f_uv + (1.0/2.0) * ((phi^3)) * f_uuu + (3.0/2.0) * ((phi^2)) * f_uuv);
     
G_1 = -(phi *u00*g_uu+ phi * u11 * g_uu + v00 * g_vv + u00 * g_uv + phi * v00 * g_uv + phi * v11 * g_uv + u11 * g_uv + v11 * g_vv + (1.0/2.0) * ((phi^3) *g_uuu + 3.0*(phi^2) * g_uuv + 3.0*phi*g_uvv));
     
F_2= - (phi * u00 * f_uu + phi * u_star *f_uu + phi * v_star * f_uv + v00 * phi* f_uv + u00 * f_uv + u_star * f_uv + v00 * f_vv + v_star * f_vv+ (phi^3)*f_uuu + 3.0*(phi^2)* f_uuv);
     
G_2 = -(phi * u00 * g_uu + phi * u_star *g_uu + phi * v_star * g_uv + v00 * phi *g_uv + u00 * g_uv + u_star *g_uv + v00 * g_vv + v_star * g_vv +(phi^3)*g_uuu + 3.0*(phi^2) * g_uuv + 3.0 *phi *g_uvv);

G1 = F_1 + shi * G_1;
G2 = F_2 + shi * G_2;

tao = ( phi +shi )/ (d_c * k_c_sqr * phi);
g1= G1 /(d_c * phi * k_c_sqr  );
g2 = G2 / (d_c * phi * k_c_sqr );

h0 = ((f_uu*phi^2 + 2.0 * f_uv *phi  + f_vv) + shi *(g_uu *phi^2 + 2.0 * g_uv * phi + g_vv ))/(d_c * k_c_sqr* phi );

rho_1 = sqrt( eta / g1);
rho_3 = (abs(h0)+ (sqrt ( h0^2 +4.0 *(g1+2.0 *g2)*eta)))/(2.0*(g1+2.0 *g2));
rho3 = abs((abs(h0) - (sqrt ( h0^2 +4.0 *(g1+2.0 *g2)*eta)))/(2.0*(g1+2.0 *g2)));


eta_3 = (h0^2 * g1) /((g2-g1)^2);
eta_4 = (h0^2*(2.0 *g1 + g2 ))/(( g2 - g1)^2); 
eta_1 = - h0^2 /(4.0 * (g1 +2.0 *g2));
mix_st= g1*(abs(h0)/(g2-g1))^2;

 fprintf(fileID1, '%f %f %f %f %f %f %f\n', eta , rho_1, rho_3,rho3, eta_3 ,eta_4, eta_1);
  % fprintf(fileID2,'%f %f %f %f %f %f %f %f\n', eta , rho_1, rho_3,rho3, g1 , g2, g1, mix_st );

 % if(eta > eta_1)
 % fprintf(fileID5, '%f %f \n', eta , rho_3);  
 % end;
 % 
 % if(eta < eta_3)
 %   fprintf(fileID3, '%f %f \n', eta , rho_1);  
 % end
 % 
 % if(eta >eta_3)
 %     fprintf(fileID4, '%f %f\n', eta , rho_1);
 % end
 % 
 % if(eta >0)
 %      fprintf(fileID6, '%f %f\n', eta , rho3);
 % end

  

 end

 

