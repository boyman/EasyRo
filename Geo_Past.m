function [Q_geo, Ro_geo] = Geo_Past(T_geo_end, t_geo_end)

Load_Constants

% T_geo_end = T_geo_end; % oC; these two need some geological background: rough idea of age and temp of the rock;
% t_geo_end = t_geo_end; % myr; defining the geological past;

H_start = (T_geo_end - T_surface)/(t_geo_end-t_surface)/Seconds_Per_MYear; % oC/second; Heating rate for this period of time; could be varying-->see a different scenario;

BD_s=Ea/R_gas/(T_surface+273.16); % surface

BD_st=Ea/R_gas/(T_geo_end+273.16); % start by lab;
P = (T_geo_end+273.16)*A*exp(-BD_st).*(1-(BD_st.^2+2.334733*BD_st+0.250621)./(BD_st.^2+3.330657*BD_st+1.681534));
J = (T_surface+273.16)*A*exp(-BD_s).*(1-(BD_s.^2+2.334733*BD_s+0.250621)./(BD_s.^2+3.330657*BD_s+1.681534));
Q_geo = (P-J)/H_start;%; %converted fraction (1-w/wo), for each single energy;
Conv = fEa.*(1-exp(-Q_geo));
VCI = sum(Conv);%;

Ro_geo = exp(-1.6+3.7*VCI); % the starting Ro before lab maturation;

end

