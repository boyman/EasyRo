function [Q_iso, EasyRo_iso] = Isothermal(T_iso,t_iso_duration,Q_ramp)

Load_Constants

%% #3: Now laboratory Isothermal Heating: during t_iso period of time

rate_const = A*exp(-Ea/R_gas/(T_iso+273.16));%; % reaction rate at each Ea, since T is constant, k is constant, unit=1/s
Q_iso = Q_ramp + rate_const * t_iso_duration*3600;
Conv = fEa.*(1-exp(-Q_iso));%; %converted fraction (1-w/wo), for each single energy;
VCI = sum(Conv);
EasyRo_iso = exp(-1.6+3.7*VCI);%;

end