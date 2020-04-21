%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Space Launch Vehicle Weight Estimation and Optimization Codes
%%% Code Developer: JUNG I. SHU
%%% Affilliations: Konkuk University, South Korea; University of South Carolina, USA
%%% Authors: Jung I. Shu, Jae-Woo Lee, Sangho Kim, Jaelyun Lee, and Yi Wang
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function StateVars = Syn_Weight_Est(StateVars)
%% Read Input Data
N               = StateVars.Num_Stage;
Payload         = StateVars.Payload;
Fairing         = StateVars.Fairing;
% M_tot           = StateVars.Total_Mass;
Prop_Type       = StateVars.Prop_Type;

PI_m = StateVars.Payload_Ratio; 
%% Arrange the Payload
M_PL                = zeros(1,N);
M_PL(1,N)           = Payload + Fairing;

for n = N: -1 : 1

    M0(n) = M_PL(n)/PI_m(n);
    
    if n ~= 1
        M_PL(n-1) = M0(n);
    end
    
end

StateVars.Total_Mass        = M0;
StateVars.Payload_Mass      = M_PL;

if length(StateVars.Engine_T_W) == 0
    StateVars.Engine_T_W = zeros(1,N);
end
% if strcmp(StateVars.Engine_T_W, '') == 0
%     StateVars.Engine_T_W = zeros(1,N);
%     
% end

%% Main Functions
for n = N : -1 : 1
    if strcmp(Prop_Type(n), 'LOX/RP1') == 1 || strcmp(Prop_Type(n), 'LOX/LH2') == 1
        StateVars = Syn_Str_LRE(StateVars, n);
    elseif strcmp(Prop_Type(n), 'HTPB') == 1
        StateVars = Syn_Str_SRM(StateVars, n);
    end
    
end

end