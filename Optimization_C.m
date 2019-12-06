%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear;
%% Read Inputs
Inputs = Write_Inputs();


% Xlb = [0.2 0.2 0.2 0.6 0.6 0.6 250 250 250];
% Xub = [0.6 0.6 0.6 1.6 1.6 1.6 350 350 350];
% X0 = [0.4 0.4 0.2 1.5 1.2 1 260 260 260];
%% Optimizer
Xlb = [0.3 0.3 0.3];
Xub = [0.6 0.6 0.6];
X0 = [0.6 0.6 0.6];
% Xlb = [0.2 0.2 0.2 1.2 0.9 0.3];
% Xub = [0.6 0.6 0.6 2 2 1.2];
% X0 = [0.3 0.4 0.3 1.2 1.2 0.9];    
% Xub = [0.5 0.5 0.5 2 2 2 350 350 350];
% 
% X0 = [0.4 0.3 0.4 1.4 1.2 0.6 300 300 300];
% Xlb = [0.2 0.2 1.6 0.9 270 320];
% Xub = [0.6 0.6 1.6 0.9 270 320];
% 
% X0 = [0.4 0.6 1.4 1.6 250 310];
% Xlb = [0.2 0.2];
% Xub = [0.6 0.6];
% X0 = [0.4 0.6];

Options         = optimset('display','iter', 'Algorithm','active-set');
Options.TolCon  = 1E-5;
Options.TolX    = 1E-5;
Options.TolFun  = 1E-5;
tic
[X, Fval] = fmincon(@(X) Objective_F(X, Inputs), X0, [], [], [], [], Xlb, Xub, @(X) Const(X, Inputs), Options);
% [X, Fval] = ga(@(X) Objective_F(X, Inputs), 9, [], [], [], [], Xlb, Xub, @(X) Const(X, Inputs), Options);
toc

Outputs = Opt_Solver(X, Inputs);

% STR_R = Outputs.W_E.Str_Ratio_Arc;
% i = 1: 1: 40;
% figure(1)
% plot(i, STR_R(:,1), '->')
% hold on
% plot(i, STR_R(:,2), '-<')
% hold on
% plot(i, STR_R(:,3), '-h')
% grid on
% xlabel ('Iteration')
% ylabel ('Structural ratio')
% legend ('1st Stage', '2nd Stage', '3rd Stage')

