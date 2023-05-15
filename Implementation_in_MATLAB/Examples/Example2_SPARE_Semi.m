%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Test for SPARE_semi                                      %
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
syms s t T Cd a
% Basic Events
syms A B C D E F G H I J K L M N O P
%%
F1 = 1-exp(-A*t);
Fs = 1-exp(-B*t);
F3 = 1-exp(-C*t);
Q = SPARE_Semi(F1,Fs, 0, 1);
Q = simplify(Q);
R = 1-Q
%% Cold Same
F1 = 1-exp(-L*t);
Fs = 1-exp(-L*t);

Q = SPARE_Semi(F1,Fs, 0, 1);
Q = simplify(Q);
R = 1-Q
%% Hot Same
F1 = 1-exp(-L*t);
Fs = 1-exp(-L*t);

Q = SPARE_Semi(F1,Fs, 1, 1);
Q = simplify(Q);
R = 1-Q