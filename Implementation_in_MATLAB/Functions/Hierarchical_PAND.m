%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 3                                                        %
% Description  : Solve SEQ (2xPAND) by means of Semi-Markov Model         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear Section
% Clear
clear all
close all
clc

format long
%% PAND
syms s La Lb Lc t Fa Fb K12 K13
P0 = [1, 0, 0, 0, 0];
K_s = [0, K12, K13,    0, 0
       0, 0,     0, 1-Fa, 0
       0, 0,     0,    0, 1-Fb
       0, 0,     0,    0, 0
       0, 0,     0,    0, 0];
E_s = [1-Fa*Fb,    0, 0,    0, 0
       0,     1-Fa, 0,    0, 0
       0,        0, 1-Fb, 0, 0
       0,        0, 0,    0, 0
       0,        0, 0,    0, 0];
       
I = eye(size(K_s,1));
K_s_inv = 0;

for ii = 0:100
    K_s_inv = K_s_inv + (K_s)^ii;
end

V_s = K_s_inv*(I - E_s);
P = P0*V_s;
pretty(P)
%% PAND
% syms s La Lb Lc t
% P0 = [1, 0, 0, 0, 0];
% K_s = [0, Lc/(s+Lc), 1-(s*Lb/((s+Lb)*(s+La+Lb))),                           0, 0
%        0,         0,                           0, 1-(s*Lb/((s+Lb)*(s+La+Lb))), 0
%        0,         0,                           0,                           0, Lc/(s+Lc)
%        0,         0,                           0,                           0, 0
%        0,         0,                           0,                           0, 0];
% 
% E_s = [Lc/(s+Lc)+1-(s*Lb/((s+Lb)*(s+La+Lb))),0,0,0,0
%        0,1-(s*Lb/((s+Lb)*(s+La+Lb))),          0,0,0
%        0,0,Lc/(s+Lc),                            0,0
%                                            0,0,0,0,0
%                                            0,0,0,0,0];
%        
% I = eye(size(K_s,1));
% K_s_inv = 0;
% 
% for ii = 0:100
%     K_s_inv = K_s_inv + (K_s)^ii;
% end
% 
% V_s = K_s_inv*(I -E_s);
% P = P0*V_s;
% pretty(P)

%% TMR
syms s F1 F2 L t
P0 = [1, 0, 0];
L1 = 3*L;
L2 = 2*L;
K_s = [0, 1-F1, 0
       0, 0,    1-F2
       0, 0,    0];
       
E_s = [1-F1, 0,     0
       0,    1-F2,  0
       0,    0,     0];
I = eye(size(K_s,1));
K_s_inv = 0;

for ii = 0:100
    K_s_inv = K_s_inv + (K_s)^ii;
end

V_s = K_s_inv*(I - E_s);
P = P0*V_s;
pretty(P)