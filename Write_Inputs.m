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
% StateVars.Perigee = 700000;
% StateVars.Apogee =  700000;
% StateVars.Latitude = 30;
% StateVars.Longitude = 170;
% StateVars.Azimuth = 170;

StateVars.ALT_Fairing_Separation = 160000;

%% Estimated Vehicle Specification
%% Sample 1
% System
% StateVars.Perigee = 700000;
% StateVars.Apogee =  700000;
% StateVars.Latitude = 30;
% StateVars.Azimuth = 170;
% StateVars.Num_Stage = 3;
% StateVars.Payload = 1500;
% StateVars.Fairing = 900;
% StateVars.T_W = [304.1/200 80.4/56.9 7/15];
% % StateVars.T_W = [1.520489296636086,1.412962276218270,0.466870540265036];
% StateVars.FPA_bo = [53 18 0];
% StateVars.Payload_Ratio = [0.20 0.2 0.20]; 
% StateVars.CD_Cr = [1.2 0 0];
% StateVars.Diameter = [3.05 2.9 2.6];
% % StateVars.Vel_Fraction = [0.292429040242904,0.311285012192521,0.396285947564575];
% StateVars.Vel_Fraction = [0.292429040242904,0.311285012192521,0.396285947564575];
% % StateVars.Total_Mission = 1.024457622125718e+04;
% 
% %%% Propulsion
% StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1' 'LOX/RP1'};
% % StateVars.Engine_T_W = [81.049536068021610,85.711677523261800,41.194459435150210];
% % StateVars.Engine_T_W = [100 100 100];
% StateVars.Engine_T_W = [81.050106609808111, 85.714285714285722, 41.176470588235290];
% % StateVars.Engine_T_W = [];
% StateVars.Engine_Budget = [0.251812080536913,0.176981132075472,0.094444444444444];%[0.251812080536913,0.176981132075472,0.094444444444444];
% StateVars.Isp_VC = [298.1 315.4 325.1];
% StateVars.Isp_Ratio = [0.85 .93 .96];
% % StateVars.Nozzle_Expansion = [8 46 89];
% StateVars.Nozzle_Expansion = [12 35 94.5];
% StateVars.Burning_Time = [150 200 300];

% Sample 2
%% System
% StateVars.Perigee = 185000;
% StateVars.Apogee =  185000;
% StateVars.Latitude = 28.5;
% % StateVars.Longitude = 170;
% StateVars.Azimuth = 35;
% StateVars.Num_Stage = 2;
% StateVars.Payload = 13150;
% StateVars.Fairing = 00;%1750
% StateVars.T_W = [1.298578488205806,0.755275984633783];%[1.29858 0.731309];
% % StateVars.FPA_bo = [60 0];
% StateVars.Payload_Ratio = [0.3 0.3]; 
% StateVars.CD_Cr = [1.3 0];
% StateVars.Diameter = [3.66 3.66];
% StateVars.Vel_Fraction = [0.415783378931986,0.584216621068014];%[0.436735523	0.563264477];
% % StateVars.Total_Mission = 1.021903710793175e+04;%4248.910783+5479.885147;
% 
% %%% Propulsion
% StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1'};
% StateVars.Engine_Budget = [0.249527344328568,0.111067640817233];%[0.312648629	0.081313902];
% StateVars.Isp_VC = [311 340];
% StateVars.Engine_T_W = [150; 150];
% % StateVars.Engine_T_W = [];
% StateVars.Isp_Ratio = [0.88 0.97];
% % StateVars.Nozzle_Expansion = [12 117];
% StateVars.Burning_Time = [200 200];

%% Sample 3-2
% StateVars.Perigee = 185000;
% StateVars.Apogee =  185000;
% StateVars.Latitude = 34.7;
% StateVars.Azimuth = 180;%201 or 158 Vandenberg Air Force Base launch azimuth
% % Mtot=[153405, 31389];
% % Tvac =[2100000,450000];
% % Mp = [117934, 27215]; 
% StateVars.Num_Stage = 2;
% StateVars.Payload = 1905;
% StateVars.Fairing = 909;
% StateVars.T_W = [1.387218776568955,1.420260066661326];
% % StateVars.FPA_bo = [50 0];
% StateVars.Payload_Ratio = [0.5 0.5]; 
% StateVars.CD_Cr = [1.18 0];
% StateVars.Diameter = [3.05 3.05];
% StateVars.Vel_Fraction = [0.422627856677085,0.577372143322915];
% % StateVars.Total_Mission = 9.346987004576386e+03;
% 
% %%% Propulsion
% StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1'};
% StateVars.Engine_Budget = [0.362077413032827,0.220361392684002];
% StateVars.Isp_VC = [296 316];%[296 316];
% StateVars.Engine_T_W = [1.448357769197982e+02,91.743119266055050];
% % StateVars.Engine_T_W = [];
% StateVars.Isp_Ratio = [0.88 0.96];
% % StateVars.Nozzle_Expansion = [25 110];
% StateVars.Burning_Time = [500 500];


%% Sample 3-1
% StateVars.Perigee = 185000;
% StateVars.Apogee =  185000;
% StateVars.Latitude = 34.7;
% StateVars.Azimuth = 158;%201 or 158 Vandenberg Air Force Base launch azimuth
% 
% StateVars.Num_Stage = 2;
% StateVars.Payload = 3100;
% StateVars.Fairing = 00;
% StateVars.T_W = [1.492871066446762,1.433949660887669];%[1.492896605643094,1.434032819449640];%[1.492896606 1.434032819];
% % StateVars.FPA_bo = [50 0];
% StateVars.Payload_Ratio = [0.2 0.3]; 
% StateVars.CD_Cr = [1.24 0];
% StateVars.Diameter = [3.05 3.05];
% StateVars.Vel_Fraction = [0.420165478851839,0.579834521148161];%[0.420169365154267,0.579830634845733];%[0.420169365 0.579830635];
% % StateVars.Total_Mission = 9.346987004576386e+03;
% 
% %%% Propulsion
% StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1'};
% StateVars.Engine_Budget = [0.211698337292162,0.234879850919224];%[0.211701358491156,0.234889884006381]; %[0.211698337 0.235024958];
% StateVars.Isp_VC = [296 316];%[296 316];
% StateVars.Engine_T_W = [1.552784818994271e+02,80.300000000000000];
% % StateVars.Engine_T_W = [];
% StateVars.Isp_Ratio = [0.85 0.96];
% % StateVars.Nozzle_Expansion = [25 110];
% StateVars.Burning_Time = [100 150];

%% Opt Sample
% StateVars.Perigee = 700000;
% StateVars.Apogee =  700000;
% StateVars.Latitude = 30;
% StateVars.Azimuth = 170;
% 
% 
% 
% StateVars.Num_Stage = 3;
% StateVars.Payload = 1500;
% StateVars.Fairing = 900;
% StateVars.T_W = [1.5 1.2 0.8];
% % StateVars.T_W = [1.520489296636086,1.412962276218270,0.466870540265036];
% % StateVars.T_W=  [1.5 1.200 0.9];
% StateVars.FPA_bo = [65 25 0];
% % StateVars.FPA_bo = [45 13 0];
% StateVars.Payload_Ratio = [0.25 0.25 0.25];
% % StateVars.Payload_Ratio = [0.183438420672884,0.249032812018618,0.277257561212708]; 
% % StateVars.Payload_Ratio = [56000/200000 0.267857142857143 0.1600]; 
% StateVars.CD_Cr = [1.2 0 0];
% StateVars.Diameter = [3.05 2.9 2.6];
% StateVars.Vel_Fraction = [0.292427260684305 0.311289566212457 0.396283173103239];
% % StateVars.Vel_Fraction = [ 0.4356 0.2 0.3644 ];
% % StateVars.Total_Mission = 10244.58;
% 
% %%% Propulsion
% StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1' 'LOX/RP1'};
% % StateVars.Engine_T_W = [70 70 70];
% % StateVars.Engine_T_W = [81.050 85.700 41.17506];
% StateVars.Engine_T_W = [100 90 80];
% % StateVars.Engine_T_W = [111.1 86.6 62.8];
% % StateVars.Engine_T_W = [];
% StateVars.Engine_Budget = [0.2518120805 0.1769811 0.094444444];
% % StateVars.Engine_Budget = [0.15 0.15 0.15];
% 
% StateVars.Isp_VC = [298.1 315.4 325.1];
% StateVars.Isp_Ratio = [0.83 .94 .96];
% % StateVars.Nozzle_Expansion = [12 35 94.5];
% % StateVars.Burning_Time = [125.7 143.6 501.6];
% StateVars.Nozzle_Expansion = [12 56 120];
% StateVars.Burning_Time = [150 200 300];

%% Opt Sample 2
StateVars.Perigee = 700000;
StateVars.Apogee =  700000;
StateVars.Latitude = 30;
StateVars.Azimuth = 170;



StateVars.Num_Stage = 3;
StateVars.Payload = 1500;
StateVars.Fairing = 900;
StateVars.T_W = [1.520489296636086,1.412962276218270,0.466870540265036];
StateVars.FPA_bo = [43.109784086738770,15.837746564620126 0];
% StateVars.FPA_bo = [45 13 0];
StateVars.Payload_Ratio = [0.25 0.15 0.10];
% StateVars.Payload_Ratio = [0.183438420672884,0.249032812018618,0.277257561212708]; 
% StateVars.Payload_Ratio = [56000/200000 0.267857142857143 0.1600]; 
StateVars.CD_Cr = [1.2 0 0];
StateVars.Diameter = [3.05 2.9 2.6];
StateVars.Vel_Fraction = [0.292429040242904,0.311285012192521,0.396285947564575];
% StateVars.Vel_Fraction = [ 0.4356 0.2 0.3644 ];
% StateVars.Total_Mission = 10244.58;

%%% Propulsion
StateVars.Prop_Type = {'LOX/RP1' 'LOX/RP1' 'LOX/RP1'};
StateVars.Engine_T_W = [81.049536068021610,85.711677523261800,41.194459435150210];
StateVars.Engine_Budget = [0.251812080536913,0.176981132075472,0.094444444444444];

StateVars.Isp_VC = [298.1 315.4 325.1];
StateVars.Isp_Ratio = [0.85 .93 .96];
% StateVars.Nozzle_Expansion = [12 35 94.5];
StateVars.Burning_Time = [100 400 300];

end