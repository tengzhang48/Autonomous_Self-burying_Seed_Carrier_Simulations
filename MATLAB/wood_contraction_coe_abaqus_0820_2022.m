%generate the contraction coefficient in abaqus to simulate the coils

clear
clc
                      
dt = 1e-4;
t = 0:dt:1;                         % t is the state variable with 0 for flat state and 1 for dry state                           

R = 1.49/2;                         % final radius
P = 2.43;                           % final pitch
h = 0.5;
Psi1 = 50/180*pi;                  % inital angle Psi
Psi2 = 70/180*pi;                  % final angle Psi

kappa1 = 0;                             % initial curvature
gamma = 1.35;                            % Scaling factor to increase the dry curavture
kappa2 = R/(R^2+(P/pi/2)^2)*gamma;      % final curvature

e20 = -0.18;                 % The average contraction along the 2 direction
e10 = 0.1;                  % This is to offset the contraction along 1 directino not to make it too large
e30 = -0.2;                 % contraction along the 3 direction
% create the strain field
Psi = Psi1*(1-t)+Psi2*t;
kappa = kappa1*(1-t) + kappa2*t;
zz = [0.45:-0.1:0.05];        % z coordinates
e11 = zeros(5,length(t));
e22 = zeros(5,length(t));
e12 = zeros(5,length(t));

for ii = 1:5
    e11(ii,:) = (zz(ii)-h)*kappa.*(sin(Psi)).^2+e10*t;
    e22(ii,:) = (zz(ii)-h)*kappa.*(cos(Psi)).^2+e20*t;
    e33 = -0.2*ones(length(t),1);
    e12(ii,:) = -(zz(ii)-0.25)*kappa.*cos(Psi).*sin(Psi);
    e33 = e30*t;
end

t = t';
% strain
e11 = e11';
e22 = e22';
e12 = e12';
e33 = e33';

% coefficient
a11 = e11./t;
a11(1,:) = a11(2,:);
a22 = e22./t;
a22(1,:) = a22(2,:);
a12 = e12./t;
a12(1,:) = a12(2,:);
a33 = e33./t;
a33(1,:) = a33(2,:);
a13 = zeros(length(t),1);
a23 = zeros(length(t),1);

% Create coefficient for different materials
M1 = [a11(:,1),a22(:,1),a33,a12(:,1),a13,a23,t];   % Layer 1
M2 = [a11(:,2),a22(:,2),a33,a12(:,2),a13,a23,t];   % Layer 2
M3 = [a11(:,3),a22(:,3),a33,a12(:,3),a13,a23,t];   % Layer 3
M4 = [a11(:,4),a22(:,4),a33,a12(:,4),a13,a23,t];   % Layer 4
M5 = [a11(:,5),a22(:,5),a33,a12(:,5),a13,a23,t];   % Layer 5

