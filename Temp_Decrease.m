% When Temp decrease during geological time e.g. Upplift
T=[20:2:500];
A=1e13; % pre-factor, unit=1/s
R=8.3145; 
Ea=[34:2:72];
for i=1:20
    for j=1:length(T)
    % P(i,j)=T(j)*A*exp(-Ea(i)/R/T(j))*(1-((Ea(i)/R/T(j))^2+2.334733*(Ea(i)/R/T(j))+0.250621)/((Ea(i)/R/T(j))^2+3.330657*(Ea(i)/R/T(j))+1.681534));
    BD13=(Ea(i)*4189)/R/(T(j)+273);
    P(i,j)=(T(j)+273)*A*exp((-BD13))*(1-(BD13^2+2.334733*BD13+0.250621)/(BD13^2+3.330657*BD13+1.681534));
    end
end
P(1,:);
plot(T,P(1,:));


