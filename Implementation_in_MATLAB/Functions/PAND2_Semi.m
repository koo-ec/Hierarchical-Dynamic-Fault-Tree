function [Q11, Q22, Q33, Q44, Q55] = PAND2_Semi(F1, F2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Solve PAND Systems by means of Semi-Markov Model         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms s t T

dF1 = diff(F1,t);
Q13 = int((1-F2)*dF1,t,0,T);

dF2 = diff(F2,t);
Q12 = int((1-F1)*dF2,t,0,T);

LST_Q12 = s*laplace(Q12, s);
LST_Q13 = s*laplace(Q13, s);

LST_Q1 = s*laplace(F1, s);
LST_Q2 = s*laplace(F2, s);

Q11 = (1-F1)*(1-F2);
Q22 = ilaplace(((1-LST_Q1)*LST_Q12)/s,t);
Q33 = ilaplace(((1-LST_Q2)*LST_Q13)/s,t);
Q44 = ilaplace((LST_Q1*LST_Q12)/s,t);
Q55 = ilaplace((LST_Q2*LST_Q13)/s,t);
% Q = 1 - (Q11+Q22+Q33+Q44);
end