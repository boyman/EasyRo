% Version 1

T_geo_end = 150;
t_geo_end = 80;
T_iso = 370;
t_ramp_duration = .5;
Ro_iso = 1.1:0.1:1.5;
Hr_t_iso_range = 0.01:0.01:240;


%% I. Calculate the needed time for isothermal heating to reach desired Ro
% Question: We will design Laboratory maturation for a field-collected source rock sample
% by pyrolysis. Under isothermal heating,how many hours do you need to
% reach designated maturity?
% Stage 1: [Geo_past] The sample has already experienced geological
% heating, with a "Geo %Ro" (background maturity, the starting point for lab heating). We don't know a detailed thermal
% history. We will then arbutrarily assign some T-t combination to reach
% the Geo %Ro.
% Stage 2: [Raming] this is to very rapidly rise the temperature to the
% T-iso, the isothermal temperature. 
% Stage 3: [Isothermal] this is to calculate the needed time to reach
% maturity beyond the Ro_geo.
% Example: the sample has a Ro_geo of 1.06%. We wanna to design isothermal
% heating at 320 oC, and want final Ros of 1.1%, 1.2, 1.3, 1.4, 1.5%. (a
% total of 5 gold tubes)

%% Stage 1

% T_geo_end = 150; % oC; these two need some geological background: rough idea of age and temp of the rock;
% t_geo_end = 80; % myr; defining the geological past;
[Q_geo, Ro_geo] = Geo_Past(T_geo_end, t_geo_end);

%% Stage 2
% T_iso = 320; % oC; should be defined by user;
% t_ramp_duration =0.5; % hr; Very rapid: using a constant heating rate
[Q_ramp, EasyRo_ramp] = Ramping(T_iso,T_geo_end,t_ramp_duration,Q_geo);

%% Stage 3
[Hr_t_iso, Ro_iso] = Find_t_iso_duration(Ro_iso, T_iso,Q_ramp,Hr_t_iso_range)
