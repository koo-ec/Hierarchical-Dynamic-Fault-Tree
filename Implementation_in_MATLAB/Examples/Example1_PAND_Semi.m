%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Test for PAND_semi                                       %
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
syms A B C D E F G H I J K L M N O P
%%
F1 = 1-exp(-A*t);
F2 = 1-exp(-B*t);
F3 = 1-exp(-C*t);
Q = PAND_Semi(F1,F2);
Q2 = PAND_Semi(Q,F3);
R = 1-Q2