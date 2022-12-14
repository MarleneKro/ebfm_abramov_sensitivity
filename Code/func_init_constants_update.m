%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Model constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load different parameter setups from seperate input files and define
%constant parameters as defined below
%MK, 20220416

function [C] = func_init_constants_update(sl,pl)

%% Sensitivity
C.prec_corr_winter = pl(1,sl);    % correction factor precipitation 
C.prec_corr_summer = pl(2,sl) ;   % correction factor precipitation summer
C.prec_grad =  pl(3,sl) ;         % precipitation lapse rate m-1
C.turb =  pl(4,sl);               % background turbulent exchange coefficient
C.alb_firn =  pl(5,sl);           % albedo firn (fraction)
C.alb_ice =  pl(6,sl);            % albedo ice (fraction)
C.rainsnowT =  pl(7,sl);          % temperature of snow to rain transition (K)
C.alb_fresh =  pl(8,sl);          % albedo fresh snow (fraction)
C.tstar_K =  pl(9,sl);            % albedo decay time-scale coefficient
C.Dfreshsnow =  pl(10,sl);        % density of fresh snow (kg m-3)
C.perc_depth =  pl(11,sl);        % characteristic deep percolation depth (m)
C.CC_tap =  pl(12,sl);            % Tappering constant

% C.prec_corr_winter = 1.85 ;   % correction factor precipitation 
% C.prec_corr_summer = 1.15 ;   % correction factor precipitation summer
% C.prec_grad = 0.0013 ;        % precipitation lapse rate m-1
% C.turb = 0.0037;              % background turbulent exchange coefficient
% C.alb_firn = 0.52;            % albedo firn (fraction)
% C.alb_ice = 0.23;             % albedo ice (fraction)
% C.rainsnowT = 273.75;         % temperature of snow to rain transition (K)
% C.alb_fresh = 0.81;           % albedo fresh snow (fraction)
% C.tstar_K = 7;              % albedo decay time-scale coefficient
% C.Dfreshsnow = 350.0;       % density of fresh snow (kg m-3)
% C.perc_depth = 6.0;         % characteristic deep percolation depth (m)


%% Tuning parameters
C.mbal_snow_thresh = 0.0003 ; % threshold snow amount to set to 0 in func_flux_SWout.
C.metstat_elev = 3837;        % elevation of legacy station Abramov (m asl)
C.Pthres = 3.5d-8;            % threshold precipitation to reset time since last snowfall (m w.e. s-1)
C.tstar_wet = 7;              % albedo decay time-scale wet snow (days)

C.tstar_dry = 30;           % albedo decay time-scale dry snow (days)
%
C.lambda = 3;  %%f(lat)     % Smith 1966 for 30-40? N. optical thickness empirical constant (depends on latitude)


%% Physical constants
% Energy balance model

C.b = 0.433;                % constant in LWin formulation
C.ecl = 0.960;              % constant in LWin formulation

C.p = 2;                    % exponent in LWin formulation
C.boltz = 5.67d-8;          % Stefan-Boltzmann constant (W m-2 K-4)
C.VP0 = 610.5;              % vapor pressure at 0 degrees C
C.Cp = 1005.7;              % specific heat of dry air (J kg-1 K-1)
C.Cw = 4187.0;              % specific heat of water (J kg-1 K-1)
C.Ls = 2.83d6;              % latent heat of sublimation/riming (J kg-1)
C.Lm = 0.33d6;              % latent heat of melting/fusion (J kg-1)
C.Lv = 2.5d6;               % latent heat of evaporation/condensation (J kg-1)
C.Rv = 462.0;               % specific gas constant water vapor (J kg-1 K-1)
C.Rd = 287.0;               % specific gas constant dry air (J kg-1 K-1)
C.eps = 0.622;              % C.Rd/C.Rv
C.dTacc = 0.01;             % threshold dT in solving the energy balance equation (K)
C.Pref = 1015d2;            % reference air pressure (Pa)
C.Pr = 5;                   % Prandtl number in SHF/LHF formulation
C.T0 = 273.15;              % melting temperature ice (K)
C.g = 9.81;                 % gravitational acceleration (m s-2)
C.rd = 8.314;               % universal gas constant (J mol-1 K-1)     

C.k_aer = 0.982;            %linear interpolation of values from Klok and Oerlemans to mean glacier elevation %;0.96; %mean value Greuell 1997 table a1 %before 0.974;            % aerosol transmissivity exponent
C.k_turb = 0.0004;          % turbulent flux coefficient

% Snow model
C.Dice = 900.0;             % density of ice (kg m-3)
C.Dfirn = 500.0;            % density of firn (kg m-3)
C.Dwater = 1000.0;          % density of water (kg m-3)
C.Ec = 60000;               % gravitational densification factor
C.Eg = 42400;               % gravitational densification factor
C.Trunoff = 0.001;          % slush runoff time-scale (days)
C.geothermal_flux = 0.0;    % geothermal heat flux (W m-2)
C.yeardays = 365.242199;    % days in a year

% Soil model
C.soil_density = 1000.0;    % soil density (no functionality)
C.soil_albedo = 0.15;       % soil albedo
C.soil_Kfrozen = 2.50;      % soil conductivity (frozen)
C.soil_Kthawed = 1.45;      % soil conductivity (thawed)
C.soil_Cfrozen = 1.95d6;    % soil specific heat capacity (frozen)
C.soil_Cthawed = 2.45d6;    % soil specific heat capacity (thawed)
C.soil_THwmin = 0.05;       % soil minimum water content
C.soil_THwmax = 0.30;       % soil maximum water content
C.soil_delta = 0.17;        % soil freezing parameter (deg C)

end

