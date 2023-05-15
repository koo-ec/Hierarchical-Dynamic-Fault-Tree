function Q = T_SPARE_Semi(F1, Fs, Fa, Ft)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Solve SPARE Systems by means of Semi-Markov Model        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cd is Probability of Switch Correct Operations
% For Hot Standby Spare (HSP)  - Alpha = 1
% For Warm Standby Spare (WSP) - 0 < Alpha < 1
% For Cold Standby Spare (CSP) - Alpha = 0
syms s t T
Fs2 = Fa;
% Alpha2 = 1;
dF1 = diff(F1,t);
Q12 = int((1-Fs2)*(1-Ft)*dF1,t,0,T);
dFs2 = diff(Fs2,t);
Q13 = int((1-F1)*(1-Ft)*dFs2,t,0,T); 
dFt = diff(Ft,t);
Q14 = int((1-Fs2)*(1-F1)*dFt,t,0,T);
 %

LST_Q12 = s*laplace(Q12, s);
LST_Q13 = s*laplace(Q13, s);
LST_Q14 = s*laplace(Q14, s);

LST_Q1 = s*laplace(1-(1-F1)*(1-Ft), s);
LST_Qs = s*laplace(1-(1-Fs)*(1-Ft), s);

LST = simplifyFraction(LST_Q14+LST_Q13*LST_Q1+LST_Q12*LST_Qs);
Q = simplify(ilaplace(LST/s,t));
end