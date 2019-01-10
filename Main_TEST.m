clear all
close all
addpath('M:\Documents\Codes\MATLAB\Windar Proj\Coherent Lidar')
FileName = 'Measurement_0.80__001.txt';
ROI=1:10;
Brg=0;
brg_LIM=[0 1e6];
    FIT_DISPLAY=1;
Width=5;
%%
RS=READ_WIND_FILE(FileName,Brg,brg_LIM,Width,FIT_DISPLAY,ROI);
%%
figure()
plot(Frq_Return,Amp_MEAN_Brg_rm);

%%
DIR_str='M:\Documents\Experiment\Experiment log\Lidar\Coherent lidar\Weighting function\Dec 19th in Lidar lab\';
Reg_brg='brg';
BRG_NAME = FILE_IN_FOLDER( DIR_str,Reg_brg);
Reg_data='\d__.{4}txt';
Data_NAME = FILE_IN_FOLDER( DIR_str,Reg_data);