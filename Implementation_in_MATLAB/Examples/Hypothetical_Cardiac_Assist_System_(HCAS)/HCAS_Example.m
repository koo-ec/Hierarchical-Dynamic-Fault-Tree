%% Hypotethical Cardiadic Asist System (HCAS)
%
%% Clear Section
clear all
close all
clc
 
format long
%% Failure Rates
CS = 1*10^-6;  SS = 2*10^-6;  CT = CS+SS;
P  = 4*10^-6;  B  = 4*10^-6;
Pu1 = 5*10^-6; Pu2 = 5*10^-6; BPu = 5*10^-6;
Mo  = 5*10^-6; MoC = 1*10^-6;
%%
syms t T s
F1 = 1 - exp(-(P+CT)*t);
F2 = 1 - exp(-(B+CT)*t);
%% Q1
P0=[1 0 0 0 0 0 0 0 0]';
M = [-Pu1-Pu2,   0,     0,     0,     0,    0,    0,  0, 0
       Pu1, -BPu-Pu2,   0,     0,     0,    0,    0,  0, 0
       Pu2,      0, -Pu1-BPu,  0,     0,    0,    0,  0, 0
         0,    BPu,     0,   -Pu2,    0,    0,    0,  0, 0
         0,    Pu2,     0,     0,  -BPu,    0,    0,  0, 0
         0,      0,   Pu1,     0,     0, -BPu,    0,  0, 0
         0,      0,   BPu,     0,     0,    0, -Pu1,  0, 0
         0,      0,     0,   Pu2,     0,  BPu,    0,  0, 0
         0,      0,     0,     0,   BPu,    0,  Pu1,  0, 0];
PP=expm(M*t)*P0;
Q1 = PP(end-1)
%% Q2
Q2 = (1-exp(-Mo*t))*(1-exp(-MoC*t));
%% Q3
P0=[1 0 0 0 0]';
P1 = P+CT;
B1 = B+CT;
M2= [-P-0.5*B-CT,      0,   0,  0, 0
       P,          -B-CT,   0,  0, 0
   0.5*B,              0, -P-CT,0, 0
       0,              B,  P,  -CT,0
      CT,             CT,  CT,  CT,0];
PPP=expm(M2*t)*P0;
Q3 = PPP(end)+PPP(end-1);
Qt = 1-(1-Q1)*(1-Q2)*(1-Q3);
t = 5000;

QQ = eval(Qt)
1-QQ
% % %% Proposed Method
% % Q11 = 1-exp(-P*t);
% % Qs = 1-exp(-B*t);
% % Qt = 1-exp(-CT*t);
% % Qa = 1-exp(-0.5*B*t);
% % Q4 = T_SPARE_Semi(Q11, Qs, Qa, Qt);
% % Qt = 1-(1-Q1)*(1-Q2)*(1-Q3);
% % Q2t = [Q1, Q2, Q3];
% % t = 5000;
% % QQ = eval(Qt)
