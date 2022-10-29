%generate the contraction coefficient in abaqus to simulate the coils

clear
clc
                      
dt = 1e-4;
t = 0:dt:1;                             % t is the state variable with 0 for flat state and 1 for dry state                           
t = t';
t_E = fix(38.56*60);                    % Characteristics time scale for elastic modulus change
t_M = fix(180*60);                      % Characteristics time scale for moisture change
tMtE = t_M/t_E;                         % The power if we write modulus function as a hydration state
EwEd = 0.2487;
E_d = 0.33e6;                           % Modulus of the dry state (GPa)
E_1 = E_d*((1-EwEd)*t.^tMtE+EwEd);      % The largest modulus of the aniostropic materials
E_2 = E_1/10;                           % Fix the anisotropic modulus ratio
E_3 = E_1/10;                           % Fix the anisotropic modulus ratio
Nu_12 = 0.3*ones(length(E_1),1);        % Poisson's ratio
Nu_13 = 0.3*ones(length(E_1),1);        % Poisson's ratio
Nu_23 = 0.3*ones(length(E_1),1);        % Poisson's ratio
G_12 = E_1/10;                          % Fix the anisotropic modulus ratio
G_13 = E_1/10;                          % Fix the anisotropic modulus ratio
G_23 = E_1/10;                          % Fix the anisotropic modulus ratio
% Create coefficient for varying elastic properties 
E_final = [E_1,E_2,E_3,Nu_12,Nu_13,Nu_23,G_12,G_13,G_23,t];   % The material properties are uniform across the thicknes


