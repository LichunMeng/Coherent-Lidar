function Rs=READ_WIND_FILE(FileName,Brg,Width,FIT_DISPLAY,Debug)
%% Initialize variables.
delimiter = '\t';

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(FileName,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
Frq = dataArray{:, 1};
Amp = dataArray{:, 2};

Frq_separation = max(Frq)+1; %%number of points for one measurement
Sample_No=length(Frq)/Frq_separation; %%number of measurement

Frq_Return=Frq(1:Frq_separation)/5'; %%return x value;
Amp_Resize =reshape(Amp',Frq_separation,Sample_No)';
%%
if Debug
figure()
close all
plot(Frq_Return,mean(Amp_Resize(:,:)))
xlabel('Frq [Mhz]');
ylabel('Signal [a.u]')
end
[x,xx]=size(Amp_Resize);

Amp_MEAN_Brg_rm = mean(Amp_Resize(:,:))-Brg; %%mean of return signal
Amd_STD=std(Amp_Resize(:,:));  %%std of the return signal
OFFSET=18;
[Peak I] =max(Amp_MEAN_Brg_rm(OFFSET:end));
I=I+OFFSET-1;
Frq_Peak = Frq_Return(I);
RIO_FIT =1:I+50;
brg_LIM=[0 1e6];
if FIT_DISPLAY
[ Frq_Peak_FIT,Peak_FIT,FWHM] = FITTING_RS( Frq_Return(RIO_FIT), Amp_MEAN_Brg_rm(RIO_FIT),brg_LIM,FIT_DISPLAY);
end
Rs=ReSig;
%Rs.Signal_matrix=Amp_Resize;
Rs.Measurement_No=x;
Rs.Frq_Return=Frq_Return; %% x value,1D, Frequency, Mhz
Rs.Amp_MEAN_Brg_rm=Amp_MEAN_Brg_rm; %% y value, 1D, amplitude
Rs.Amd_STD=Amd_STD;           %%std of y value, 1D,
Rs.Amp_Peak_find=Peak;            %% Peak amplitude, 0D, given by max()
Rs.Frq_Peak_find=Frq_Peak;        %% frequency value correspond to the Peak amplitude, 0D, given by max()
%Rs.Amp_Peak_FIT=Peak_FIT;        %% Peak amplitude, 0D, given by fitting
%Rs.Frq_Peak_FIT=Frq_Peak_FIT;    %% frequency value correspond to the Peak amplitude, 0D, given by fit()
%Rs.FWHM=FWHM;            %% width 0D, given by fit()
%Rs.AREA =FWHM*Frq_Peak_FIT;
Rs.Peak_Index=I;
if I-Width<1
    Rs.AREA = sum(Rs.Amp_MEAN_Brg_rm(1:I+Width));
else
    Rs.AREA = sum(Rs.Amp_MEAN_Brg_rm(I-Width:I+Width));
end
end


