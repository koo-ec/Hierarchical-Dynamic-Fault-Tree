% clear all
% close all
clc
%
format long
% syms s t T
warning('off')
simOut = sim('Test1_Non_exponential','StopTime','300','ReturnWorkspaceOutputs','on');
Merle_Out = simOut.find('Merle_Out');
t = Merle_Out.time;
Q2 = Merle_Out.signals.values;
s=figure(1);
set(s,'Color','w');

plot(t,Q2,'ob','LineWidth',1)
% ylim([0.1 1.1])
% grid on
ent = sprintf('\n');
title(['\fontsize{16}DFT with Non-Exponential Events'],'FontName', 'Times New Roman')
xlabel('\fontsize{14}Time','FontName', 'Times New Roman')
ylabel('\fontsize{14}System Reliability','FontName', 'Times New Roman')
hold on
plot(t,Q2,'r','LineWidth',2)

hleg = legend('\fontsize{12}Suggested Approach','\fontsize{12} Algebraic (G. Merle)','Location','Southeast');
       set(hleg,'FontAngle','italic','TextColor',[.3,.2,.1])
hold off