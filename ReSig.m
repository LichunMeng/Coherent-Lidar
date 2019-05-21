classdef ReSig
    %RESIG Summary of this class goes here
    %   Detailed explanation goes here
    % this class summarizes the properties of the return signal
    % 
    
    properties
        
        Distance;
        Frq_Return; %% x value,1D, Frequency, Mhz
        Amp_MEAN_Brg_rm; %% y value, 1D, amplitude
        Amd_STD;           %%std of y value, 1D,
        Amp_Peak_find;            %% Peak amplitude, 0D, given by max()
        Frq_Peak_find;        %% frequency value correspond to the Peak amplitude, 0D, given by max()
        POWER;        %% Peak amplitude, 0D, given by fitting
        VOLTAGE;     %% frequency value correspond to the Peak amplitude, 0D, given by fit()
        FWHM;            %% width 0D, given by fit()
        AREA;            %% integration get area
        Measurement_No;%% number os scanning
        Signal_matrix; %% all data
        Peak_Index;
    end
    
    methods
        function FullName =FindName(Obj,PropertyName)
            IndexC = strfind(properties(ReSig),PropertyName);
            Index = find(not(cellfun('isempty',IndexC)));
            switch Index
                case 0
                    error('key error');
                case 1
                    FullName='Distance [m]';
                case 2
                    FullName='Frequency [MHz]';
                case 3
                    FullName='Intensity [a.u.]';
                case 4
                    FullName='STD [a.u.]';
                case 5
                    FullName='Peak [a.u.]';
                case 6
                    FullName='Peak Frequency [MHz]';
                case 7
                    FullName='Power [mW]';
                case 8
                    FullName='Voltage [V]';
                case 9
                    FullName='FWHM [MHz]';
                case 10
                    FullName='Area [a.u.]';
                case 11
                    FullName='Measurement NO.';
                otherwise
                    error('Unknow key');
            end
        end
    end
    
end

