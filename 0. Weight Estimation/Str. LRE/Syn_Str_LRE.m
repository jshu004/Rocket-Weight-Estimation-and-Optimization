%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function StateVars = Syn_Str_LRE(StateVars, n)
% format long
%% User Inputs
K_Eng   = StateVars.Engine_Budget(n);
M0      = StateVars.Total_Mass(n);
ISP     = StateVars.Isp_VC(n);
T_W     = StateVars.T_W(n);
t_bo    = StateVars.Burning_Time(n);
Mpl     = StateVars.Payload_Mass(n);

T_W_E   = StateVars.Engine_T_W(n);

% Ce = StateVars.Ce;
%% Parameters
g0      = 9.81;

%% Main Formula
i = 0;
Err = inf;
Tol = 1E-8;
while Err > Tol
    i = i + 1;
    
    Mp          = T_W * M0.* t_bo ./ ISP;
    Ms          = M0 - (Mp + Mpl);
    Thrust      = T_W * M0 * g0;
    
    % Liquid Pump-Fed Rocket Engine Mass
    if T_W_E == 0
        N_Exp   = StateVars.Nozzle_Expansion(n);
        C=1;%Ce; % Coefficient for calibration of engine mass
        Meng    = (7.81*10^-4 * Thrust + 3.37*10^-5 * Thrust * sqrt(N_Exp) + 59)*C;
        
    else 
        Meng = ( Thrust / T_W_E ) / g0;
    end
    
    Ms_new = Meng ./ K_Eng;
    
    M_tot = Ms_new + Mp + Mpl;

    Y = t_bo;

    F = Ms_new - Ms;

    dF  = -T_W.*M0./ISP;

    al = 1.1;
    Y_new = Y + al*dF\F;
%     Y_new = Y + 1*F/dF;
    
    Err = abs(Y_new - Y);
    
    Y = Y_new;
    
    t_bo = Y;
    
%     if t_bo < 0 
%         t_bo = abs(t_bo);
%     end
    
    
    
    if i > 200
        
        break;
    end
%     
end


%% Structural Ratio
Eps     = Ms ./ (Ms + Mp);
MR      = M_tot./(M_tot-Mp);
PI_W    = Mpl/M_tot;

%% Write Output Data
StateVars.Total_Mass_Input(n)       = M0;
StateVars.Total_Mass_Output(n)      = M_tot;
if n > 1
    StateVars.W_Payload_Mass(n-1)   = M_tot;
end
StateVars.W_Propellant(n)           = Mp;
StateVars.W_Structure(n)            = Ms;
StateVars.W_Structure_N(n)          = Ms_new;
StateVars.W_Engine(n)               = Meng;
StateVars.W_Structural_Ratio(n)     = Eps;
StateVars.W_Mass_Ratio(n)           = MR;
StateVars.W_Pi(n)                   = PI_W;
StateVars.W_Thrust(n)               = Thrust;
StateVars.T_W(n)                    = T_W;
StateVars.T_W_Engine(n)             = Thrust./(Meng*9.81);
StateVars.Burning_Time(n)           = t_bo;
StateVars.Mass_Flow(n)              = Mp/t_bo;

end