%% BE - PAND - AND - 2
clear all
close all
clc
%%
for t = 1:100
La = 0.05; Ca = 0.6;
Lb = 0.06; Cb = 0.7;
Lc = 0.07; Cc = 0.8;
Ld = 0.008; Cd = 0.9;

M = [-La-Lb-Lc,      0,      0,       0,     0,   0,   0,   0,   0,   0,     0,0
         La,    -Lb-Lc,      0,       0,     0,   0,   0,   0,   0,   0,     0,0
         Lb,         0, -La-Lc,       0,     0,   0,   0,   0,   0,   0,     0,0
         Lc,         0,      0,  -La-Lb,     0,   0,   0,   0,   0,   0,     0,0
          0,        Lb,      0,       0,   -Lc,   0,   0,   0,   0,   0,     0,0
          0,        Lc,      0,       0,     0, -Lb,   0,   0,   0,   0,     0,0
          0,        0,      La,       0,     0,   0, -Lc,   0,   0,   0,     0,0
          0,        0,      Lc,       0,     0,   0,   0, -La,   0,   0,     0,0
          0,        0,       0,      La,     0,   0,   0,   0, -Lb,   0,     0,0
          0,        0,       0,      Lb,     0,   0,   0,   0,   0, -La,     0,0
          0,        0,       0,       0,    Lc,  Lb,  Lc,   0,  Lb,   0,     0,0
          0,        0,       0,       0,     0,   0,   0,  La,   0,  La,     0,0];
       
P0=zeros(size(M,1),1); P0(1) = 1;
P=expm(M*t)*P0;
Q_MArkov(t) = P(end-1);
end
%% 
syms t T s
F1 = 1-exp(-La*t); F1s = Ca*F1; F1u = (1-Ca)*F1;
F2 = 1-exp(-Lb*t); F2s = Cb*F2; F2u = (1-Cb)*F2;
F3 = 1-exp(-Lc*t); F3s = Cc*F3; F3u = (1-Cc)*F3;
F4 = 1-exp(-Ld*t); F4s = Cd*F4; F4u = (1-Cd)*F4;

%%
Q1 = PAND_Semi(F1,F2*F3); 
t = 1:100;
Q = eval(Q1);
plot(Q_MArkov,'-.m','LineWidth',2.5)
hold on
plot(t,Q,'-.b','LineWidth',2.5)