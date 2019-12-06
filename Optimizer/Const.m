%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [c, ceq] = Const(X, Inputs)

global MR Eps Mp tbo Mtot M_Flow
%% Read Inputs
N = Inputs.Num_Stage;

%% Constraints
c(1)   = sum(X(1:N))-1;
c(2)   = 1-sum(X(1:N));
switch N
    case 2
        c(3) = -1/MR(1) + Eps(1);
        c(4) = -1/MR(2) + Eps(2);

    case 3
        c(3) = -1/MR(1) + Eps(1);
        c(4) = -1/MR(2) + Eps(2);
        c(5) = -1/MR(3) + Eps(3);
        
    case 4
        c(3) = -1/MR(1) + Eps(1);
        c(4) = -1/MR(2) + Eps(2);
        c(5) = -1/MR(3) + Eps(3);
        c(6) = -1/MR(4) + Eps(4);

end
% c(6) = - M_Flow(3) + 100;
% c(7) = - M
% for n = N:1
%     c(1*n+2) = -(1/MR(n)-Eps(n));
%     c(2*n+4) = - M_Flow(n) + 150;
%     c(2*n+4) = -X(3*n+1) * Mp(n) / X(2*n+1) * tbo(n) +5*Mtot(n);
% end

ceq = [];

end