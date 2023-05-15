%% Clear Section
clear all
close all
clc
 
format long
% Failure Rates
CS = 1*10^-6;  SS = 2*10^-6;  CT = CS+SS;
P  = 4*10^-6;  B  = 4*10^-6;
Pu1 = 0.01; Pu2 = 0.02; BPu = 0.03;
Mo  = 5*10^-6; MoC = 1*10^-6;
%
syms t T s
F1 = 1 - exp(-(P+CT)*t);
F2 = 1 - exp(-(B+CT)*t);
% Q1
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
Q1 = PP(end-1);
t = 100;
Q1 = eval(Q1)
%%
syms t T s
F1 = 1 - exp(-Pu1*t);
F2 = 1 - exp(-Pu2*t);
F3 = 1 - exp(-BPu*t);
Q11 = PAND_Semi(F1,F3);
Q22 = PAND_Semi(F3,F2);
Q33 = Load_Semi(F2, F1, Q11, Q22);
t = 100;
Q2 = eval(Q33)
%%
syms t T s
F1 = 1 - exp(-Pu1*t);
F2 = 1 - exp(-Pu2*t);
F3 = 1 - exp(-BPu*t);
Q11 = 1 - (1-F1)*(1-F2);
Q22 = SPARE_Semi(Q11,F3,0,1);
Q33 = PAND_Semi(F1,F2);
Q44 = PAND_Semi(Q33,Q22);
t = 100;
Q3 = eval(Q33)