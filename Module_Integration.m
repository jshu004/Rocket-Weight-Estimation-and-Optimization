%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc;
format long
%% Inputs
StateVars = Write_Inputs();


%% Module Integration
i = 0;
Err = inf;
Tol = 1E-5;
while Err>Tol || i < 200
    i = i + 1;
       
    % Weight Estimation Module
    StateVars = Syn_Weight_Est(StateVars);
    
    % Mission Velocity Module
%     StateVars = Syn_Mission(StateVars);
    
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
% Option 1
Outputs = Write_Outputs(StateVars);

% Option 2
% Outputs = Write_Outputs_OPT(StateVars);

% STR_R = Outputs.W_E.Str_Ratio_Arc;
% i = 1: 1: 14;
% figure(1)
% plot(i, STR_R(:,1), '->')
% hold on
% plot(i, STR_R(:,2), '-<')
% % hold on
% plot(i, STR_R(:,3), '-h')
% grid on
% xlabel ('Iteration')
% ylabel ('Structural ratio')
% legend ('1st Stage', '2nd Stage', '3rd Stage')