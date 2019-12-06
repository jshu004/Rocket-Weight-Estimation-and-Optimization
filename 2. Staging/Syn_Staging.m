%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function StateVars = Syn_Staging(StateVars)
format long
%% Read Inputs
N           = StateVars.Num_Stage;         % Num. of Stages
Tot_M_V     = StateVars.Total_Mission;     % m/s, Total Mission Velocity
V_f         = StateVars.Vel_Fraction;      % (-), Velocity Fraction
Payload     = StateVars.Payload;           % kg, Payload Mass
M_F         = StateVars.Fairing;           % kg, Fairing Mass
ISP         = StateVars.Isp_VC;            % sec, Specific Impulse in Vacuum Condition
Eps         = StateVars.W_Structural_Ratio;  % Structural Ratio

%% Parameters
R           = 6378000;                  % m, Radius of Earth
mu          = 398600.4418*(10^3)^3;     % Gravitational Constant of Earth
g0          = mu/(R^2);                 % m/s^2, Gravitational Acceleration

%% Calculate Mass Properties of a Launch Vehicle
M_PL(N)     = Payload + M_F;
dV          = Tot_M_V.*V_f;
MR          = exp(dV./(ISP.*g0));
for n = N : -1:1
    M_tot(n)        = M_PL(n)*(1-Eps(n))/((1/MR(n))-Eps(n));
    if n > 1
        M_PL(n-1)         = M_tot(n);
    end
end
Ms          = (M_tot - M_PL).*Eps;
Mp          = M_tot - (Ms + M_PL);
M_Stage     = Ms + Mp;
Payload_R   = M_PL./M_tot;
Eps         = Ms./M_Stage;

%% Check Sum(V_F) = 1
Sum_V_F     = sum(V_f);

%% Write Outputs
StateVars.Total_Mass          = M_tot;        % Total Mass
StateVars.Payload_Mass        = M_PL;         % Payload Mass
StateVars.Propellant_Mass     = Mp;           % Propellant Mass
StateVars.Structure_Mass      = Ms;           % Structural Mass
StateVars.Gross_Mass          = M_Stage;      % Gross Mass
StateVars.Structural_Ratio    = Eps;          % Structural Ratio
StateVars.Mass_Ratio          = MR;           % Mass Ratio
StateVars.Payload_Ratio       = Payload_R;    % Payload Ratio
StateVars.Vel_Distribution    = dV;           % Velocity Distribution
StateVars.Vel_Sum             = Sum_V_F;      % Sum of Velocity Fraction

end