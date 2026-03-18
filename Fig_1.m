clc;
clear det;
fileID1 = fopen('real_eigen.txt', 'w');

for i= 0:250
k_T = 0.0+(50.0/250.0)*i;

mu=0.66;
kappa= 0.15;
gamma= 3.73;
beta1 = 0.5;
delta = 0.1;
rho = 1.76;
xi= 0.1;
d1= 0.01;
d2=1.0;


%eigenvalues check

         u_sol= 0.4476;
         w_sol= 1.0575;

        F_u = (((rho * ((1/kappa) - (2 * u_sol) - w_sol)) - (kappa * u_sol^2)) / (rho + (kappa * u_sol))^2)- xi - ((gamma * w_sol ) / (u_sol  + 1)^2);

        F_w = -u_sol * ((1 / (rho + (kappa * u_sol))) + (gamma / (u_sol + 1)));

        H_u = -((beta1 * w_sol) / (u_sol + 1)^2) *((u_sol )^2 + (2 * u_sol) + w_sol  - (1 / kappa));

        H_w = ((((beta1 * u_sol) ) / (u_sol + 1)) * ((1 / kappa) - u_sol - (2 * w_sol)))- delta - (2 * mu * w_sol);

         % k_T= (F_u+d1*H_w)/2.0*d1;
         % disp(k_T);
%         % A_3= [F_u F_w; H_u H_w];
        B_3=[F_u-d1*k_T F_w; H_u H_w-d2*k_T];

%         % disp(A_3);
%         % eigenvalues= eig(A_3);
%         % disp(eigenvalues);
%         % disp(det(A_3));
% 
%         % disp(B_3);
         eigenvalues= eig(B_3);
         real_eigen= real(eigenvalues(1));
         %disp(real_eigen);
% 
%          disp(eigenvalues);
%         % disp(det(B_3));
         fprintf(fileID1, '%f %f \n', k_T,real_eigen);
        
end
 