function Q = Load_Semi(F1, F2, F3, F4)
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
% Alpha2 = 1;
dF1 = diff(F1,t);
Q12 = int((1-F2)*dF1,t,0,T);
dF2 = diff(F2,t);
Q13 = int((1-F1)*dF2,t,0,T);

LST_Q12 = s*laplace(Q12, s);
LST_Q13 = s*laplace(Q13, s);

LST_Q1 = s*laplace(F4, s);
LST_Q3 = s*laplace(F3, s);

LST = simplifyFraction(LST_Q13*LST_Q1+LST_Q12*LST_Q3);
Q = simplify(ilaplace(LST/s,t));
end