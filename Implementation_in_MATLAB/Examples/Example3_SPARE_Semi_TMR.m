%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Name : Semi-Markov Analysis                                     %
% Author       : Koorosh Aslansefat                                       %
% Version      : 1                                                        %
% Description  : Test for SPARE_semi - Example 3                          %
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
FTMR = 1-3*exp(-2*L*t)+2*exp(-3*L*t);
Fs = 1-exp(-L*t);

Q = SPARE_Semi(FTMR,Fs, 1, 1);
Q = simplify(Q);
R = 1-Q