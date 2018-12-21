classdef ReSig
    %RESIG Summary of this class goes here
    %   Detailed explanation goes here
    % this class summarizes the properties of the return signal
    % 
    
    properties
        Frq_Return; %% x value,1D, Frequency, Mhz
        Amp_MEAN_Brg_rm; %% y value, 1D, amplitude
        Amd_STD;           %%std of y value, 1D,
        Peak;            %% Peak amplitude, 0D, given by max()
        Frq_Peak;        %% frequency value correspond to the Peak amplitude, 0D, given by max()
        Peak_FIT;        %% Peak amplitude, 0D, given by fitting
        Frq_Peak_FIT;    %% frequency value correspond to the Peak amplitude, 0D, given by fit()
        FWHM;            %% width 0D, given by fit()
    end
    
    methods
    end
    
end

