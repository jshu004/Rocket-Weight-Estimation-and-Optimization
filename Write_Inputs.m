%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function StateVars = Write_Inputs()
format long
%% Launch Site & Orbit Information
StateVars.Perigee = 700000;
StateVars.Apogee =  700000;
StateVars.Latitude = 30;
StateVars.Longitude = 170;
StateVars.Azimuth = 170;

StateVars.ALT_Fairing_Separation = 160000;

%% Estimated Vehicle Specification
%% Sample 1
%%% System
% StateVars.Num_Stage = 3;
% StateVars.Payload = 1500;
% StateVars.Fairing = 900;
% % StateVars.T_W = [1.6 1.3 0.9];
% StateVars.T_W = [1.520 1.41278 0.4666507];
% StateVars.FPA_bo = [65 25 0];
% StateVars.Payload_Ratio = [0.20 0.2 0.20]; 
% StateVars.CD_Cr = [1.2 0 0];
% StateVars.Diameter = [3.05 2.9 2.6];
% StateVars.Vel_Fraction = [0.29242904	0.311284897	0.396285801];
% % StateVars.Vel_Fraction = [ 0.4 0.4 0.2 ];
% StateVars.Total_Mission = 10244.58;
% 
% %%% Propulsion
% StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1' 'LOX/RP1'};
% StateVars.Engine_T_W = [81.050 85.700 41.17506];
% % StateVars.Engine_T_W = [];
% StateVars.Engine_Budget = [0.2518120805 0.1769811 0.094444444];
% StateVars.Isp_VC = [298.1 315.4 325.1];
% StateVars.Isp_Ratio = [0.9 .96 .96];
% StateVars.Nozzle_Expansion = [12 56 120];
% StateVars.Burning_Time = [150 200 300];

% Sample 2
%% System
% StateVars.Num_Stage = 2;
% StateVars.Payload = 13150+1750;
% StateVars.Fairing = 00;
% StateVars.T_W = [1.29858 0.731309];
% StateVars.FPA_bo = [60 0];
% StateVars.Payload_Ratio = [0.20 0.2]; 
% StateVars.CD_Cr = [1.4 0];
% StateVars.Diameter = [3.66 3.66];
% StateVars.Vel_Fraction = [0.436735523	0.563264477];
% StateVars.Total_Mission = 4248.910783+5479.885147;
% 
% %%% Propulsion
% StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1'};
% StateVars.Engine_Budget = [0.312648629	0.081313902];
% StateVars.Isp_VC = [311 340];
% StateVars.Engine_T_W = [150; 150];
% % StateVars.Engine_T_W = [];
% StateVars.Isp_Ratio = [0.9 0.96];
% StateVars.Nozzle_Expansion = [12 117];
% StateVars.Burning_Time = [150 200];


%% Sample 3
% StateVars.Num_Stage = 2;
% StateVars.Payload = 3100;
% StateVars.Fairing = 00;
% StateVars.T_W = [1.492896606 1.434032819];
% StateVars.FPA_bo = [50 0];
% StateVars.Payload_Ratio = [0.20 0.2]; 
% StateVars.CD_Cr = [1.2 0];
% StateVars.Diameter = [3.66 3.66];
% StateVars.Vel_Fraction = [0.420169365 0.579830635];
% StateVars.Total_Mission = 9346.967982;
% 
% %%% Propulsion
% StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1'};
% StateVars.Engine_Budget = [0.211698337 0.235024958];
% StateVars.Isp_VC = [296 316];
% StateVars.Engine_T_W = [155.2806979 80.25384969];
% % StateVars.Engine_T_W = [];
% StateVars.Isp_Ratio = [0.9 0.96];
% StateVars.Nozzle_Expansion = [25 110];
% StateVars.Burning_Time = [150 200];

%% Opt Sample
StateVars.Num_Stage = 3;
StateVars.Payload = 1500;
StateVars.Fairing = 900;
% StateVars.T_W = [1.6 1.3 0.9];
StateVars.T_W = [1.500	1.200	0.900];
StateVars.FPA_bo = [65 25 0];
StateVars.Payload_Ratio = [0.20 0.2 0.20]; 
StateVars.CD_Cr = [1.2 0 0];
StateVars.Diameter = [3.05 2.9 2.6];
% StateVars.Vel_Fraction = [0.29242904	0.311284897	0.396285801];
StateVars.Vel_Fraction = [ 0.4 0.4 0.4 ];
% StateVars.Total_Mission = 10244.58;

%%% Propulsion
StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1' 'LOX/RP1'};
% StateVars.Engine_T_W = [81.050 85.700 41.17506];
StateVars.Engine_T_W = [];
StateVars.Engine_Budget = [0.2518120805 0.1769811 0.094444444];
StateVars.Isp_VC = [298.1 315.4 325.1];
StateVars.Isp_Ratio = [0.9 .96 .96];
StateVars.Nozzle_Expansion = [12 56 120];
StateVars.Burning_Time = [150 200 300];


end