%% bias_nodes1d
% Below is a demonstration of the features of the |bias_nodes1d| function

%% Syntax
% |[xb]=bias_nodes1d(x,f_bias);|

%% Description 
% The |bias_nodes1d| function is able to adjust the point (or node) spacing
% of a curve based on a bias factor and biasing scheme.

%% Examples

%%
clear; close all; clc;

%%
% Plot settings
figColor='w'; figColorDef='white';
fontSize=15;
markerSize1=25;

%% Example: Biasing node spacing allong a curve

f_bias=1.8; %Bias factor
n=15; %Number of steps
x=linspace(0,10,n);
[xb]=bias_nodes1d(x,f_bias);

%%
% Plotting results
hf1=figuremax(figColor,figColorDef);
title('Biased nodes','FontSize',fontSize);
xlabel('X','FontSize',fontSize);ylabel('Y','FontSize',fontSize); zlabel('Z','FontSize',fontSize);
hold on;

plot(x,ones(size(x)),'k+','MarkerSize',markerSize1);
plot(xb,ones(size(x)),'r.','MarkerSize',markerSize1);

axis equal; axis tight;  grid on;  
set(gca,'FontSize',fontSize);
drawnow;

%% 
%
% <<gibbVerySmall.gif>>
% 
% _*GIBBON*_ 
% <www.gibboncode.org>
% 
% _Kevin Mattheus Moerman_, <gibbon.toolbox@gmail.com>
