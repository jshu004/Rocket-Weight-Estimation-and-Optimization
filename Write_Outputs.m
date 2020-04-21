%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Outputs = Write_Outputs(StateVars)

%% Weight Estimation
Outputs.W_E.Total_Mass = StateVars.Total_Mass_Output;
Outputs.W_E.Propellant_Mass = StateVars.W_Propellant;
Outputs.W_E.Structure_Mass_1 = StateVars.W_Structure;
Outputs.W_E.Structure_Mass_2 = StateVars.W_Structure_N;
Outputs.W_E.Stuctural_Ratio = StateVars.W_Structural_Ratio;
Outputs.W_E.Mass_Ratio = StateVars.W_Mass_Ratio;
Outputs.W_E.Overall_Mass_Ratio = prod(StateVars.W_Mass_Ratio);
Outputs.W_E.Payload_Ratio = StateVars.W_Pi;
Outputs.W_E.Burn_Time = StateVars.Burning_Time;
Outputs.W_E.Engine_Mass = StateVars.W_Engine;
Outputs.W_E.Thrust  = StateVars.W_Thrust;
Outputs.W_E.Mass_Flow = StateVars.Mass_Flow;
Outputs.W_E.T_W_Engine = StateVars.T_W_Engine;
% Outputs.W_E.History.Structural_Ratio = StateVars.Str_Ratio;
%% Mission Velocity
Outputs.M_V.Total_Mission = StateVars.Total_Mission;
Outputs.M_V.Orbit_Velocity = StateVars.Orbit;
Outputs.M_V.VEL_Gain = StateVars.Gain;
Outputs.M_V.Total_Loss = StateVars.Total_Loss;
Outputs.M_V.Total_Dloss = StateVars.Total_Dloss;
Outputs.M_V.Total_Tloss = StateVars.Total_Tloss;
Outputs.M_V.Total_Gloss = StateVars.Total_Gloss;
Outputs.M_V.Loss_Drag = StateVars.Loss_Drag;
Outputs.M_V.Loss_Thrust = StateVars.Loss_Thrust;
Outputs.M_V.Loss_Gravity = StateVars.Loss_Gravity;
Outputs.M_V.Altitude_bo = StateVars.H_bo;
Outputs.M_V.Velocity_bo = StateVars.V_bo; 
% Outputs.M_V.Calibration_GravityLoss = StateVars.C_Grv;
Outputs.M_V.Calibration_ThrustLoss = StateVars.C_Thrt;
Outputs.M_V.KD = StateVars.KD;
Outputs.M_V.KA = StateVars.KA;
Outputs.M_V.KG = StateVars.KG;
Outputs.M_V.KGG = StateVars.KGG;
Outputs.M_V.Averaged_FPA =StateVars.g_bo;

%% Staging
Outputs.STG.Total_Mass = StateVars.Total_Mass;
Outputs.STG.Payload_Mass = StateVars.Payload_Mass;
Outputs.STG.Propellant_Mass = StateVars.Propellant_Mass;
Outputs.STG.Structure_Mass = StateVars.Structure_Mass;
Outputs.STG.Structural_Ratio = StateVars.Structural_Ratio;
Outputs.STG.Mass_Ratio = StateVars.Mass_Ratio;
Outputs.STG.VEL_Distribution = StateVars.Vel_Distribution;
Outputs.STG.Gross_Mass = StateVars.Gross_Mass;
Outputs.STG.Payload_Ratio = StateVars.Payload_Ratio;
Outputs.STG.Overall_PayRatio = prod(StateVars.Payload_Ratio);
Outputs.STG.Vel_Sum = StateVars.Vel_Sum;

%% Error
Outputs.Error.Total_Mass = norm(Outputs.STG.Total_Mass - Outputs.W_E.Total_Mass);
Outputs.Error.Propellant_Mass = norm(Outputs.STG.Propellant_Mass - Outputs.W_E.Propellant_Mass);


%% History
Outputs.History.Mission_Velocity = StateVars.VTOT_History;
Outputs.History.Propellant_Mass = StateVars.MP_History;
Outputs.History.Structure_Mass = StateVars.MS_History;
Outputs.History.Structural_Ratio = StateVars.Str_Ratio;
Outputs.History.Loss_Gravity = StateVars.VG_History;
Outputs.History.Loss_Thrust = StateVars.VT_History;
Outputs.History.Loss_Drag = StateVars.VD_History;
end