function Q = PAND_Semi(F1, F2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Solve PAND Systems by means of Semi-Markov Model         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms s t T

dF1 = diff(F1,t);
Q13 = int((1-F2)*dF1,t,0,T);

LST_Q13 = s*laplace(Q13, s);
% LST_Q13 = simplify(LST_Q13);

LST_Q2 = s*laplace(F2, s);

% LST = simplifyFraction();
LST = LST_Q13*LST_Q2;
% Q = simplify(ilaplace(LST/s,t));
Q = ilaplace(LST/s,t);
end