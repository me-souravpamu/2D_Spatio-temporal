clc; clear;

% mu=0.18;
% kappa= 0.15;
% gamma= 3.73;
% beta1 = 0.5;
% beta=0.5;
% delta = 0.1;
% rho = 1.76;
% xi= 0.1;
% d1= 0.01;
% d2=1.0;
% 
% kappa_vals = linspace(0.001, 0.3, 100);
% 
% mu_T_vals = nan(size(kappa_vals));
% 
% for i = 1:length(kappa_vals)
%     kappa = kappa_vals(i);
% 
%     mu_scan = linspace(0.18, 0.84, 100);
%     for mu = mu_scan
% 
% %cubic_equation solve
% 
%  a = (kappa*beta1*(xi-gamma))+(((kappa*xi)+1.0)*mu);
%  b = (((rho*xi)-(rho*gamma)+gamma-1.0)*beta1)+(((kappa*xi)+1.0)*(beta1+(2.0*mu)))-((1.0+kappa*gamma)*delta)+(((rho*xi)-(1.0/kappa))*mu);
%  c = (rho*(xi+(gamma/kappa))*beta1) - (((rho+kappa)*gamma+2.0)*delta) + (((2.0*rho+kappa)*xi)-(2.0/kappa)+1.0)*mu;
%  d = -(rho*((gamma*delta)-(xi*mu))+delta+(mu/kappa));
% 
% coeffs = [a, b, c, d];
% 
% u= roots(coeffs);
% 
% %disp(u);
% 
%       w(1) =((-beta1*u(1)*u(1))+(((beta1/kappa)-delta)*u(1))-delta)/(((beta1+mu)*u(1))+mu);
%       %disp(w(1));
%       w(2) =((-beta1*u(2)*u(2))+(((beta1/kappa)-delta)*u(2))-delta)/(((beta1+mu)*u(2))+mu);
%       %disp(w(2));
%       w(3) =((-beta1*u(3)*u(3))+(((beta1/kappa)-delta)*u(3))-delta)/(((beta1+mu)*u(3))+mu);
%       %disp(w(3));
% % disp(w);
% %end;
% %eigenvalues check
% for i=1:3
%     if(abs(imag(u(i)))<0.00001 && real(u(i))>0 && abs(imag(w(i)))<0.00001 && real(w(i))>0 &&(real(u(i))+real(w(i)))<(1.0/kappa))
%          u_sol= u(i);
%          w_sol= w(i);
% 
%         F_u = (((rho * ((1/kappa) - (2 * u_sol) - w_sol)) - (kappa * u_sol^2)) / (rho + (kappa * u_sol))^2)- xi - ((gamma * w_sol ) / (u_sol  + 1)^2);
% 
%         F_w = -u_sol * ((1 / (rho + (kappa * u_sol))) + (gamma / (u_sol + 1)));
% 
%         H_u = -((beta1 * w_sol) / (u_sol + 1)^2) *((u_sol )^2 + (2 * u_sol) + w_sol  - (1 / kappa));
% 
%         H_w = ((((beta1 * u_sol) ) / (u_sol + 1)) * ((1 / kappa) - u_sol - (2 * w_sol)))- delta - (2 * mu * w_sol);
% 
%        A_3= [F_u F_w; H_u H_w];
%         % disp(A_3);
%         % eigenvalues= eig(A_3);
%         % disp(eigenvalues);
%         disp(trace(A_3));
%          disp(det(A_3));
%         T= trace(A_3)*trace(A_3)- 4*det(A_3);
% 
%         if((T)<0  && trace(A_3)<0)
%             u_star=u_sol;
%             w_star=w_sol;
%             disp(u_star);
%         else, continue; end;
%         clear det;
%     end;
% end;
% 
%    a11= (((rho * ((1/kappa) - (2 * u_star) - w_star)) - (kappa * u_star)) / (rho + (kappa * u_star))^2)- xi - ((gamma * w_star ) / (u_star  + 1)^2);
% 
%     a12= -u_star * ((1 / (rho + (kappa * u_star))) + (gamma / (u_star + 1)));
% 
%      a21 = -((beta * w_star) / (u_star + 1)^2) *((u_star )^2 + (2 * u_star) + w_star  - (1 / kappa));
% 
%       a22 = ((((beta * u_star) ) / (u_star + 1)) * ((1 / kappa) - u_star - (2 * w_star)))- delta - (2 * mu * w_star);
% 
%        detJ = a11*a22 - a12*a21;
%         if detJ <= 0, continue; end
% 
%         k2_T = sqrt(detJ / (d1 * d2));
% 
%         trJ = a11 + a22;
%         tr_k = trJ - (d1 + d2)*k2_T;
%         det_k = detJ - (a11*d2 + a22*d1)*k2_T + d1*d2*(k2_T)^2;
% 
%         disc = tr_k^2 - 4*det_k;
%         if disc >= 0.0001
%         %     lambda1 = 0.5 * (tr_k + sqrt(disc));
%         %     lambda2 = 0.5 * (tr_k - sqrt(disc));
% 
%             if ( abs(tr_k) < 0.00001 || abs(disc) < 0.00001)
%                 mu_T_vals(i) = mu;
%                 break;
%             end
%         end
%     end
% end
% 
% % Plot
% figure;
% hold on;
% plot(kappa_vals, mu_T_vals, 'r-', 'LineWidth', 2);
% %plot(alpha_vals, beta_H_vals, 'g-', 'LineWidth', 2);
% xlabel('\kappa'); ylabel('\mu');
% %title('Figure 1: Turing and Hopf Bifurcation Lines');
% legend('\mu_T (Turing)',  'Location', 'northeast');
% xlim([min(kappa_vals), max(kappa_vals)]);
% ylim([0, 0.9]);

%***********************************************************************************   

fileID1 = fopen('turing.txt', 'w');
fileID2 = fopen('hopf.txt', 'w');
for i= 0:500
kappa=0.00002+(1.0/500.0)*i;

for j=0:500
mu=0.0+(1.0/500.0)*j;

% mu=0.18;
% kappa = 0.15;
gamma = 3.73;
beta = 0.5;
delta = 0.1;
rho = 1.76;
xi = 0.1;
d1 = 0.01;
d2 = 1.0;

 a = (kappa*beta*(xi-gamma))+(((kappa*xi)+1.0)*mu);
 b = (((rho*xi)-(rho*gamma)+gamma-1.0)*beta)+(((kappa*xi)+1.0)*(beta+(2.0*mu)))-((1.0+kappa*gamma)*delta)+(((rho*xi)-(1.0/kappa))*mu);
 c = (rho*(xi+(gamma/kappa))*beta) - (((rho+kappa)*gamma+2.0)*delta) + (((2.0*rho+kappa)*xi)-(2.0/kappa)+1.0)*mu;
 d = -(rho*((gamma*delta)-(xi*mu))+delta+(mu/kappa));

coeffs = [a, b, c, d];

u= roots(coeffs);
w(1) =((-beta*u(1)*u(1))+(((beta/kappa)-delta)*u(1))-delta)/(((beta+mu)*u(1))+mu);
w(2) =((-beta*u(2)*u(2))+(((beta/kappa)-delta)*u(2))-delta)/(((beta+mu)*u(2))+mu);
w(3) =((-beta*u(3)*u(3))+(((beta/kappa)-delta)*u(3))-delta)/(((beta+mu)*u(3))+mu);

for i=1:3
 if(abs(imag(u(i)))<0.0001 && real(u(i))>0 && abs(imag(w(i)))<0.0001 && real(w(i))>0 &&(real(u(i))+real(w(i)))<(1.0/kappa))
    u_sol= u(i);
    w_sol= w(i);

   F_u = (((rho * ((1/kappa) - (2 * u_sol) - w_sol)) - (kappa * u_sol^2)) / (rho + (kappa * u_sol))^2)- xi - ((gamma * w_sol ) / (u_sol  + 1)^2);

   F_w = -u_sol * ((1 / (rho + (kappa * u_sol))) + (gamma / (u_sol + 1)));

   H_u = -((beta * w_sol) / (u_sol + 1)^2) *((u_sol )^2 + (2 * u_sol) + w_sol  - (1 / kappa));

   H_w = ((((beta * u_sol) ) / (u_sol + 1)) * ((1 / kappa) - u_sol - (2 * w_sol)))- delta - (2 * mu * w_sol);

        k2_c = (F_u + d1 * H_w)/(2.0 * d1) ;
        if(abs(k2_c)<0.001)
            disp('k2_c is zero');

        else
        trJ = F_u + H_w;
        tr_k = trJ - (d1 + d2)*k2_c;
        det_k = (F_u*H_w - F_w*H_u) - (F_u*d2 + H_w*d1)*k2_c + d1*d2*(k2_c)^2;

        lamda1= (0.5)*(tr_k+sqrt((tr_k*tr_k)-4.0*det_k));
        lamda2=  (0.5)*(tr_k-sqrt((tr_k*tr_k)-4.0*det_k));

        if(abs(real(lamda1))<0.001 && abs(imag(lamda1))<0.001)
             fprintf(fileID1, '%f %f\n', kappa, mu);
             else
       disp('lamda1 is not zero eigen value');
        end

         if(abs(real(lamda2))<0.0001 && abs(imag(lamda2))<0.0001)
             fprintf(fileID2, '%f %f\n', kappa, mu);
             else
       disp('lamda2 is not zero eigen value');
        end
        end;

     end;
end
end
end





