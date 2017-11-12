function [Q_ramp, EasyRo_ramp] = Ramping(T_iso,T_geo_end, t_ramp_duration,Q_geo)

Load_Constants

%% #2: Now jump to the Lab Temp before isothermal heating
% T_iso = T_iso; % oC; should be defined by user;
% t_ramp = t_ramp; % hr; duration of rapid heating; using a constant heating rate
H_ramp = (T_iso-T_geo_end)/t_ramp_duration/3600; % oC/second;

BD_iso = Ea/R_gas/(T_iso+273.16); % to reach T_iso
BD_st = Ea/R_gas/(T_geo_end+273.16); % the start point in lab;

J = (T_geo_end+273.16)*A*exp(-BD_st).*(1-(BD_st.^2+2.334733*BD_st+0.250621)/(BD_st.^2+3.330657*BD_st+1.681534));
P = (T_iso+273.16)*A*exp(-BD_iso).*(1-(BD_iso.^2+2.334733*BD_iso+0.250621)/(BD_iso.^2+3.330657*BD_iso+1.681534));

Q_ramp = Q_geo + (P-J)/H_ramp;%; %converted fraction (1-w/wo), for each single energy;
Conv = fEa.* (1-exp(-Q_ramp));
VCI = sum(Conv);%;
EasyRo_ramp = exp(-1.6+3.7*VCI);% the starting Ro before lab maturation;

end