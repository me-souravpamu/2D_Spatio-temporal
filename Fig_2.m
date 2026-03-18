NX = 200;           
NY = 200;    
DX = 0.33;  
DY = 0.33; 
DT = 0.014;  
TIME_STEPS = 500000;
TRANSIENT_STEPS = 400000;
% u_sum=0.00;

RHO = 1.76;       
KAPPA = 0.12;       
XI = 0.1;          
GAMMA = 3.73;       
BETA1 = 0.5;      
DELTA = 0.1;      
DU = 0.01;   
DW = 1.0;  
mu = 0.60;   

% for k=0:5
% mu= 0.05+(0.20*k);
% end

[u, w] = initialize(NX, NY, 5e-4);

for t = 1:TIME_STEPS
    [u, w] = update(u, w, DU, DW, RHO, KAPPA, XI, GAMMA, BETA1, DELTA, mu, DT, DX, DY);% Update prey and predator densities

      if t > TRANSIENT_STEPS && mod(t, 500000) == 0
        save_output(u, w, t, NX, NY);
      end
end

function [u, w] = initialize(NX, NY, perturbation)
    u =  0.3637 + perturbation * rand(NX, NY);
    w =  1.3128 + perturbation * rand(NX, NY);
end

function L = laplacian(grid, DX, DY)
    NX = size(grid, 1);
    NY = size(grid, 2);
    
    ip = [2:NX, 1];  
    im = [NX, 1:NX-1];
    jp = [2:NY, 1];  
    jm = [NY, 1:NY-1]; 

    L = (grid(ip, :) + grid(im, :) + grid(:, jp) + grid(:, jm) - 4 * grid) / (DX * DY);
end

function [u_new, w_new] = update(u, w, DU, DW, RHO, KAPPA, XI, GAMMA, BETA1, DELTA, mu, DT, DX, DY)
    lu = laplacian(u, DX, DY);
    lw = laplacian(w, DX, DY); 
    z = 1.0 / KAPPA - (u + w);

    u_new = u + DT * (DU * lu + (z .* u) ./ (RHO + KAPPA * u) - XI * u - GAMMA * w .* u ./ (1 + u));

    w_new = w + DT * (DW * lw + BETA1 * u .* z .* w ./ (1 + u) - DELTA * w - mu * w .* w);
end

function save_output(u, w,timestep, NX, NY)
    filename = sprintf('data_timestep_kp_0.12_mu_0.60_Du_0.01_%d.dat', timestep);
    fileID = fopen(filename, 'w');
     for i = 1:NX
        for j = 1:NY
            fprintf(fileID, '%d\t%d\t%f\t%f\n', i, j, u(i, j), w(i, j));
           
        end
     end
    fclose(fileID);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
