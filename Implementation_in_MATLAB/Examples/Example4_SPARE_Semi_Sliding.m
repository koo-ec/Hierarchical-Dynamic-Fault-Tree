%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Solve CPS Systems by means of Semi-Markov Model          %
% Validate from: Boudali, H., Dugan, J.B.: A discrete-time Bayesian       %
%                network reliability modeling and analysis framework.     %
%                Reliability Engineering and System Safety 87(3),         %
%                337–349 (2005)                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear Section
% Clear
clear all
close all
clc

format long
%% 
% Parameter Definition
%
syms s t T
% Basic Events
syms A B Ls

%%
F1 = 1-exp(-A*t);
F2 = 1-exp(-(A+A)*t);

F3 = 1-exp(-A*t);
F4 = 1-exp(-(A+A)*t);
%%
% G_top = F2 PAND F3
Q1 = SPARE_Semi(F1,F2, 0, 1)
Q2 = SPARE_Semi(F3,F4, 0, 1);
Q3 = PAND_Semi(Q1,Q2);

R = 1 - Q3
%%
pretty(R)
