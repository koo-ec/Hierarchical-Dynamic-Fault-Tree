%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Solve SPARE by means of Semi-Markov Model                %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear Section
% Clear
clear all
close all
clc

format long
%% PAND
syms s La Lb Lc t Fa Fb Ft K12 K13 K24 K25 K34 K35 K45
P0 = [1, 0, 0, 0, 0];
K_s = [0, K12, K13,   0, 0
       0,   0,   0, K24, 1-Ft
       0,   0,   0, K34, 1-Ft
       0,   0,   0,   0, 1-Ft
       0,   0,   0,   0, 0];
   
E_s = [1-Fa*Fb,       0,       0,    0, 0
       0,       1-Fb*Ft,       0,    0, 0
       0,             0, 1-Fa*Ft,    0, 0
       0,             0,       0, 1-Ft, 0
       0,             0,       0,    0, 0];
       
I = eye(size(K_s,1));
K_s_inv = 0;

for ii = 0:100
    K_s_inv = K_s_inv + (K_s)^ii;
end

V_s = K_s_inv*(I - E_s);
P = P0*V_s;
pretty(P)