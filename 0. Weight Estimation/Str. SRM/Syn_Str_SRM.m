%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%function StateVars = Syn_Str_SRM(StateVars, n)
%% User Inputs
% Corr_F  = StateVars.Motor_CorrFactors(n);
M0      = StateVars.Total_Mass(n);
Mpl     = StateVars.Payload_Mass(n);
ISP     = StateVars.Isp_VC(n);
T_W     = StateVars.T_W(n);
t_bo    = StateVars.Burning_Time(n);

%% Parameters
g0      = 9.81;

%% Main Formula
Err = inf;
Tol = 1E-12;
while Err > Tol
    
    Mp          = T_W * M0* t_bo / ISP;
    Ms          = M0 - (Mp + Mpl);
    Thrust      = T_W * M0 * g0;
    
    Ms_new      = 0.135*Mp;
%     if Mp <= 10000
%         Ms_new       = ( 0.0706*Mp+18.974 );
%     else
%         Ms_new       = ( 0.1554*Mp );
%     end
    
    
    M_tot = Ms_new + Mp + Mpl;
    
%     Y1 = T_W;
%     Y2 = t_bo;
    Y = t_bo;
%     F1 = M0 - M_tot;
%     F2 = Ms_new - Ms;
    F = Ms_new - Ms;
%     dF11 = -M0.*t_bo./ISP; 
%     dF12 = T_W.*M0./ISP;       
%     dF21 = -M0.*t_bo./ISP;
%     dF22 = -T_W.*M0./ISP;
dF  = -T_W.*M0./ISP;
    
%     Y   = [Y1;Y2];
%     F   = [F1;F2];
%     dF  = [dF11 dF12; dF21 dF22];
    
    Y_new = Y + dF\F;
    
    Err = norm(Y_new - Y);
    
    Y = Y_new;
    
   
%     T_W     = Y(1,1);
%     t_bo    = Y(2,1);
t_bo = Y;

    
end


%% Structural Ratio
Eps     = Ms ./ (Ms + Mp);
MR      = M_tot./(M_tot-Mp);

%% Write Output Data
StateVars.Total_Mass_Input(n)       = M0;
StateVars.Total_Mass_Output(n)      = M_tot;
if n > 1
    StateVars.W_Payload_Mass(n-1)    = M_tot;
end
StateVars.W_Propellant(n)           = Mp;
StateVars.W_Structure(n)            = Ms;
StateVars.W_Structure_N(n)          = Ms_new;
% StateVars.W_Engine(n)               = [];
StateVars.W_Structural_Ratio(n)     = Eps;
StateVars.W_Mass_Ratio(n)           = MR;
StateVars.W_Thrust(n)               = Thrust;
StateVars.T_W(n)              = T_W;
StateVars.Burning_Time(n)     = t_bo;
% Dummy
% StateVars.Engine_Budget(n)   = K_Eng;
% StateVars.Isp_vc(n)           = ISP;

end