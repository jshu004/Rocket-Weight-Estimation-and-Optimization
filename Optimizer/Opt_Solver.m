%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Outputs = Opt_Solver(X, StateVars)

N = StateVars.Num_Stage;

StateVars.Vel_Fraction = X(1:N);
% StateVars.T_W = X(N+1 : 2*N);
% StateVars.Isp_VC = X(2*N+1 : 3*N);

%% Module Integration
i = 0;
Err = inf;
Tol = 1E-1;
while Err>Tol || i < 200
    i = i + 1;
    
    % Weight Estimation Module
    StateVars = Syn_Weight_Est(StateVars);
    
    % Mission Velocity Module
    StateVars = Syn_Mission(StateVars);
    
    % Staging Module
    StateVars = Syn_Staging(StateVars);
    
    %%% Stopping Criteria
    Mtot_1 = StateVars.Total_Mass_Output;
    Mtot_2 = StateVars.Total_Mass;
    
    Err = norm(Mtot_1 - Mtot_2);
    
    % Archive of Structural ratios
    StateVars.Str_Ratio(i,:) = StateVars.W_Structural_Ratio;
    
end


%% Write Outputs
Outputs = Write_Outputs_OPT(StateVars);