function [EasyRo] = Isothermal(T_iso,t_iso)
% isothermal
% constant heating rate from low initial Ro
% the most accurate so far Alan Excel
Ea=[34:2:72]; %kcal/mol
fEa=[3.00E-02 3.00E-02	4.00E-02	4.00E-02	5.00E-02	5.00E-02	6.00E-02	4.00E-02	4.00E-02	7.00E-02	6.00E-02	6.00E-02	6.00E-02	5.00E-02	5.00E-02	4.00E-02	3.00E-02	2.00E-02	2.00E-02	1.00E-02];
% percentage of each Ea, sum to 0.85 to account for the EasyRo range up to
% 4.7%
A=1e13; % pre-factor, unit=1/s
R_gas=8.3145; % ideal gas constant, unit=J/(mol.K)
% T_iso unit=oC; should be an input value, define the isotheral target Temperature;
% t_iso unit=hr; should be an input vlaue, define the duration of isothermal heating
% at T_iso;
VCI=0; % sum of converted fraction under each energy;
for i=1:20 % size(Ea)
    k(i)=A*exp(-Ea(i)*4184/R_gas/(T_iso+273))%; % reaction rate at each Ea, since T is constant, k is constant, unit=1/s
    Conv(i)=fEa(i)*(1-exp(-t_iso*3600*k(i)))%; %converted fraction (1-w/wo), for each single energy;
    VCI=VCI+Conv(i)%;
end
EasyRo=exp(-1.6+3.7*VCI)%;

    end