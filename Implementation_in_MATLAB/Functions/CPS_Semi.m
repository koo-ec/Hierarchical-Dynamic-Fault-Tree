function Q = CPS_Semi(F1, F2, F3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Solve PAND Systems by means of Semi-Markov Model         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms s t T

dF1 = diff(F1,t);
Q12 = int((1-F2)*(1-F3)*dF1,t,0,T);

dF2 = diff(F2,t);
Q25 = int((1-F3)*dF2,t,0,T);

LST_Q12 = s*laplace(Q12, s);
LST_Q12 = simplify(LST_Q12);
LST_Q25 = s*laplace(Q25, s);
LST_Q25 = simplify(LST_Q25);
LST_Q3 = s*laplace(F3, s);

LST = simplifyFraction(LST_Q12*LST_Q25*LST_Q3);
Q = simplify(ilaplace(LST/s,t));
end