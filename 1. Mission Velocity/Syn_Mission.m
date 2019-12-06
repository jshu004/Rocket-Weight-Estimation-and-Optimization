%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function StateVars = Syn_Mission(StateVars)
%% Read Inputs
N           = StateVars.Num_Stage;         % Num. of Stages
Perigee     = StateVars.Perigee;           % Perigee
Apogee      = StateVars.Apogee;            % Apogee
LAT         = StateVars.Latitude;          % Latitude
AZI         = StateVars.Azimuth;           % Azimuth
M_tot       = StateVars.Total_Mass_Output; % Total Mass at Each Stage
MR          = StateVars.W_Mass_Ratio;      % Mass Ratio
ISP         = StateVars.Isp_VC;            % Specific Impulse in Vaccuum Condition
ISP_ratio   = StateVars.Isp_Ratio;         % ISP Ratio (Isp_vc/Isp_sls)
T_W         = StateVars.T_W;               % Thrust to Weight Ratio
gamma_bo    = StateVars.FPA_bo;            % Burnout Flight Path Angle
t_bo        = StateVars.Burning_Time;      % Burning Time
CD          = StateVars.CD_Cr(1);          % Drag Coefficient in the Critical Condition
d           = StateVars.Diameter;          % Stage Diameter

%% Unit Conversion (SI to English)
% Parameters
m2ft        = 3.28084;
kg2lb       = 2.20462;

% Conversion
M_tot       = M_tot .* kg2lb;
d           = d .* m2ft;
%% Define Paremeters 
R           = 6378000;              % Earth's Radius 
mu          = 398600.4418*(10^3)^3; % Earth's Gravitational Constant
omega       = 2*pi/(24*3600);       % Earth's Angular Velocity
g0          = 32.2; %mu/(R^2);             % Gravitational Acceleration

%% Addition Calculation of Vehicle Dimension
S_ref       = pi*(d./2).^2;         % Cross-Sectional Area of a Stage

%% Orbit Information
A           = (2*R + Apogee + Perigee)/2;                   % Semi-Major of an Orbit
V_OI        = sqrt(mu*(2/(R+Perigee)-1/A));                 % Orbit Insertion Velocity
V_G         = omega * R * cosd(LAT)*sind(AZI);  % Velocity Gain

%% Calculate Coefficients
% Gravity Loss Coefficient 1
KGG          = 6E-8*ISP.^3.4751;

% Gravity Loss Coefficient 2
KG25        = -0.2231.*T_W.^2 + 1.1657.*T_W - 0.5217;
KG50        = -0.1165.*T_W.^2 + 0.7021.*T_W - 0.1387;
KG          = (KG50-KG25).*(MR-2.5)./(5.0-2.5) + KG25;

% Thrust Loss Coefficient
KA15        = -441.9276.*ISP_ratio.^3 + 1098.2046.*ISP_ratio.^2 -933.9648.*ISP_ratio + 277.6878;
KA30        = -680.9968.*ISP_ratio.^3 + 1726.1914.*ISP_ratio.^2 -1484.2623.*ISP_ratio + 439.06771;
KA          = ( (KA30-KA15).*(T_W-1.5)/(3.0-1.5) + KA15 ).*100;
% KA(2) = 0;
% KA(3) = 0;

% Drag Loss Coefficient
Temp         = sqrt(ISP)./T_W;
KD00         = (17.445.*Temp.^-1.0812);
KD40         = (39.086.*Temp.^-1.3285);
KD60         = (114.44.*Temp.^-1.6917);
for n = 1 : N
    if gamma_bo(n) < 0
        KD(n)       = (KD40(n)-KD00(n)).*(gamma_bo(n)-00)./(40-00) + KD00(n);
    elseif  gamma_bo(n) < 40 && gamma_bo(n) >= 0
        KD(n)       = (KD40(n)-KD00(n)).*(gamma_bo(n)-00)./(40-00) + KD00(n);
    elseif  gamma_bo(n) < 60 && gamma_bo(n) >= 40 
        KD(n)       = (KD60(n)-KD40(n)).*(gamma_bo(n)-40)./(60-40) + KD40(n);
    elseif  gamma_bo(n) >= 60
        KD(n)       = (KD60(n)-KD40(n)).*(gamma_bo(n)-40)./(60-40) + KD40(n);
    end
end
KD = (T_W).*KD.*10.^6;


%% Calculate the Velocity Losses
g_bo = [90 gamma_bo];

% if sum(t_bo) <= 700
%     C_Grav = ( Perigee/100000 * (1000/sum(t_bo)))^0.1;
% C_Grav = 1;
% else
    C_Grav = ( Perigee/100000 )^0.1;
% end

% Loss_G       = ( (g0.*t_bo - 220* KGG).*(1-KG.*(1-1./MR).*(gamma_bo./90).^2) );
for i = 1: N
 
    Vel_G(i)       = C_Grav.* g0.*( 0.95 * sind(g_bo(i) ) + 0.8 * sind( g_bo(i+1) ) ) * t_bo(i) / 2;
    Loss_G(i)      = (Vel_G(i) - 38.45 * KGG(i)).*(1-KG(i).*(1-1./MR(i)).*(gamma_bo(i)./90).^2);

end
% KD
Vf = StateVars.Vel_Fraction; 
Vd = V_OI * Vf(1);
h_1st = 0.5 * Vd * t_bo(1);
StateVars.H_bo_1st = h_1st;
% Loss_D = zeros(1,N);

if h_1st <= 50000;
    Loss_D       = KD.*CD.*S_ref./M_tot;
else
    Loss_D       = KD(1).*CD(1).*S_ref(1)./M_tot(1);
    
    
end

% Loss_D = 0.5 * (0.5 * 1.224 * Vd^2 * CD(1) * S_ref(1)/ M_tot(1)) * t_bo(1);

% Loss_D = 0.5*S_ref(1)*(T_W(1)*g0 * t_bo(1))^2./M_tot(1)/6; 
% Loss_D       = KD(1).*CD(1).*S_ref(1)./(M_tot(1))*t_bo(1);
Loss_T       = KA;
Loss_Vel     = Loss_G + Loss_D + Loss_T;

%% Unit Conversion (English to SI)
Loss_G       = Loss_G .* 0.3048;
Loss_D       = Loss_D .* 0.3048;
Loss_T       = Loss_T .* 0.3048;
Loss_Vel     = Loss_Vel .* 0.3048;

Tot_Loss     = sum(Loss_Vel);

%% Total Mission Velocity
Tot_M_V      = (V_OI + Tot_Loss - V_G);

%% Write Outputs
StateVars.Total_Mission   = Tot_M_V;      % Total Mission Velocity
StateVars.Orbit           = V_OI;         % Orbit Insertion Velocity
StateVars.Gain            = V_G;          % Velocity Gained by Earth Rotation
StateVars.Total_Loss      = Tot_Loss;     % Total Loss of Velocity
StateVars.Loss_Drag       = Loss_D;       % Loss of Velocity by Drag
StateVars.Loss_Thrust     = Loss_T;       % Loss of Velocity by Thrust
StateVars.Loss_Gravity    = Loss_G;       % Loss of Velocity by Gravity
StateVars.Total_Dloss     = sum(Loss_D);
StateVars.Total_Tloss     = sum(Loss_T);
StateVars.Total_Gloss     = sum(Loss_G);
StateVars.KD              = KD;
StateVars.KA              = KA;
StateVars.KG              = KG;
StateVars.KGG             = KGG;

end