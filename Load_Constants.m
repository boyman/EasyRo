
% Constants Definition
T_surface=20; %oC, the Temp at time 0, before any burial;
t_surface=0; %my, the time 0
Ea=[34:2:72] * 4184; %J/mol, NOT kcal/mol
fEa=[3.00E-02 3.00E-02	4.00E-02	4.00E-02	5.00E-02	5.00E-02	6.00E-02	4.00E-02	4.00E-02	7.00E-02	6.00E-02	6.00E-02	6.00E-02	5.00E-02	5.00E-02	4.00E-02	3.00E-02	2.00E-02	2.00E-02	1.00E-02];
% percentage of each Ea, sum to 0.85 to account for the EasyRo range up to
% 4.7%
A=1e13; % pre-factor, unit=1/s
R_gas=8.3145; % ideal gas constant, unit=J/(mol.K)
Seconds_Per_MYear = 1e6 * 365 * 24 * 3600;
