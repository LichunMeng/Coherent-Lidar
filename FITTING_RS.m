function [ Frq_Peak,Peak,FWHM] = FITTING_RS( Frq_Return, Amp_MEAN_Brg_rm,brg_LIM,DISPLAY)
%FITTING_RS Summary of this function goes here
%   Detailed explanation goes here
% this function try to fit the returning lidar signal.
% Frq_Return, x value, Mhz
% Amp_MEAN_Brg_rm, y value, intensity
% brg_LIM, [DOWN UP], interval of fitting parameter c
% DISPLAY, whether showing fitting graph
UP=brg_LIM(2);
DOWN=brg_LIM(1);
[xData, yData] = prepareCurveData( Frq_Return, Amp_MEAN_Brg_rm);
MAX=max(Amp_MEAN_Brg_rm);
% Set up fittype and options.
ft = fittype( 'a*exp(-(x-b)^2/w^2*log(2))+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [MAX*0.5 0 0 0];
opts.StartPoint = [MAX 10 10000 10];
opts.Upper = [MAX*2 100 1000000 200];


% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
if DISPLAY
    figure( 'Name', 'untitled fit 1' );
    h = plot( fitresult, xData, yData );
    legend( h, 'y vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
    % Label axes
    xlabel x
    ylabel y
    grid on
    pause(0.2);
    close all
end
Frq_Peak = fitresult.b;
Peak=fitresult.a;
FWHM=fitresult.w*2;
end

