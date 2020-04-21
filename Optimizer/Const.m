%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [c, ceq] = Const(X, Inputs)
%% Read Inputs
N = Inputs.Num_Stage;

%% Produce Outputs
Outputs = Opt_Solver(X, Inputs);
MR = Outputs.STG.Mass_Ratio;
Eps = Outputs.STG.Structural_Ratio;

%% Constraints
c(1)   = sum(X(1:N))-1;
c(2)   = 1-sum(X(1:N));
switch N
    case 2
        c(3) = -1/MR(1) + Eps(1);
        c(4) = -1/MR(2) + Eps(2);
    case 3
        tol = 1e-6;
        c(3) = -1./MR(1) + Eps(1) + tol;
        c(4) = -1./MR(2) + Eps(2) + tol;
        c(5) = -1./MR(3) + Eps(3) + tol;
    case 4
        c(3) = -1/MR(1) + Eps(1);
        c(4) = -1/MR(2) + Eps(2);
        c(5) = -1/MR(3) + Eps(3);
        c(6) = -1/MR(4) + Eps(4);
end

ceq = [];

end