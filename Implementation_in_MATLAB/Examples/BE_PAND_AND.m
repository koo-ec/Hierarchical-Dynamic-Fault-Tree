%% BE - PAND - AND
clear all
close all
clc
%%
t = 100;
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
Q_MArkov = P(end-1)
%% 
syms t T s
F1 = 1-exp(-La*t); F1s = Ca*F1; F1u = (1-Ca)*F1;
F2 = 1-exp(-Lb*t); F2s = Cb*F2; F2u = (1-Cb)*F2;
F3 = 1-exp(-Lc*t); F3s = Cc*F3; F3u = (1-Cc)*F3;
F4 = 1-exp(-Ld*t); F4s = Cd*F4; F4u = (1-Cd)*F4;
%%
% Q1 = PAND_Semi(F1,F2*F3); LST_Q1 = s*laplace(Q1, s);
% Q2 = PAND_Semi(F1,F2);    LST_Q2 = s*laplace(Q2, s);
% Q3 = PAND_Semi(F1,F3);    LST_Q3 = s*laplace(Q3, s);
% 
% dF2 = diff(F2,t);
% dF3 = diff(F3,t);
% Q12 = int((1-F1)*(1-F2)*dF3,t,0,T);
% Q13 = int((1-F1)*(1-F3)*dF2,t,0,T);
% 
% LST_Q12 = s*laplace(Q12, s);
% LST_Q13 = s*laplace(Q13, s);
% 
% LST = LST_Q1 + LST_Q12*LST_Q2 + LST_Q13*LST_Q3;
% 
% Q11 = ilaplace((LST_Q1)/s,t);
% Q22 = ilaplace((LST_Q12*LST_Q2)/s,t);
% Q33 = ilaplace((LST_Q13*LST_Q3)/s,t);
% Q = Q11*Q22*Q33;
% 
% t = 100;
% s= eval(Q)
%%
Q1 = PAND_Semi(F1,F2*F3); 
Q2 = PAND_Semi(F2,PAND_Semi(F1,F3));   
Q3 = PAND_Semi(F3,PAND_Semi(F1,F2));      
t = 100;
Q = [Q1 Q2, Q3];
s= eval(Q)
Q = Q1+Q2+Q3-Q1*Q2-Q1*Q3-Q2*Q3+Q1*Q2*Q3;
s= eval(Q)
Q = 1-(1-Q1)*(1-Q2)*(1-Q3);
s= eval(Q)
%%
syms t T s
LL = (Lb*Lc^2)/(Lb^2 + Lb*Lc + Lc^2) + (Lb^2*Lc)/(Lb^2 + Lb*Lc + Lc^2);

FF = 1-exp(-LL*t);
Q1 = PAND_Semi(F1,FF); 
t = 100;
disp('---')
ss = eval(Q1)
