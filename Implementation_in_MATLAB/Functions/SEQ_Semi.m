function Q = SEQ_Semi(F1, F2, F3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Solve PAND Systems by means of Semi-Markov Model         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms s t T

LST_Q1 = s*laplace(F1, s);

LST_Q2 = s*laplace(F2, s);

LST_Q3 = s*laplace(F3, s);

LST = LST_Q1*LST_Q2*LST_Q3;
Q = simplify(ilaplace(LST/s,t));
end