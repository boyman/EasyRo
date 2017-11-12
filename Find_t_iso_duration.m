function [Hr_t_iso, Ro_iso] = Find_t_iso_duration(Ro_iso, T_iso,Q_ramp,Hr_t_iso_range)

Load_Constants

%% #3: Now laboratory Isothermal Heating: during t_iso period of time
Hr_t_iso = []; % the duration needed for each targeting Ro_iso

for EasyRo = Ro_iso
    diff_min = 1e6;
    t_iso_fit = 1;
    for t_iso_duration = Hr_t_iso_range
        
        [~,EasyRo_iso] = Isothermal(T_iso,t_iso_duration,Q_ramp);
        
        diff = EasyRo_iso - EasyRo; %from the range of possible duration, find the best fit
        
        if diff^2 < diff_min
            diff_min = diff^2;
            t_iso_fit = t_iso_duration;
        end
    end
    Hr_t_iso = [Hr_t_iso, t_iso_fit];
end

end