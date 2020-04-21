%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;
format long
%% Read Inputs
addpath(genpath(pwd));
Inputs = Write_Inputs();


%% Optimizer
Xlb = [0.2 0.2 0.2];
Xub = [0.5 0.5 0.5];
X0 = [0.292429040242904,0.311285012192521,0.396285947564575];

Options         = optimset('display','iter', 'Algorithm','active-set','scaleProblem','obj-and-constr', 'UseParallel',false);

tic
[X, Fval,exitflag] = fmincon(@(X) Objective_F(X, Inputs), X0, [], [], [], [], Xlb, Xub, @(X) Const(X, Inputs), Options);
toc

Outputs = Opt_Solver(X, Inputs);
