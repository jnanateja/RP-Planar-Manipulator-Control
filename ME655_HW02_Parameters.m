%% PARAMETERS ENTRY
clear all
clc

% Use-defined P1_1, P_2, t_f
P_1x = 4;
P_1y = 4;
P_2x = 3;
P_2y = 1;
P_1 = [P_1x; P_1y];
P_2 = [P_2x; P_2y];
t_f = 5; % Seconds

% Robot configuration
m1 = 2;
m2 = 2;
lc = 3;
robot_geometry=[m1;m2;lc];
% lc = l1 = 3
% Initial position error
deltaP_error=[-.25;.05];

% To solve for polynomial coefficients based on initial conditions
% Coefficients / a1=0; a2=0; a3=0;
rhs = [1; 0; 0];
lhs = [t_f^3,       t_f^4,      t_f^5;
       3*t_f^2,     4*t_f^3,    5*t_f^4;
       6*t_f,       12*t_f^2,   20*t_f^3];   
coefficients = lhs \ rhs;
a3 = coefficients(1,1);
a4 = coefficients(2,1);
a5 = coefficients(3,1);

% Control parameters
omega_n = 20;

k_p = omega_n^2*eye(2);
k_v = 2*sqrt(k_p)*eye(2);


