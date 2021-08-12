%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%// Abstract:   Script to visualize matlabs basic plots
%// Autor:      Jannik Wiessler
%// Date:       Dec, 2020
%// Version:    1.0
%// Note:       Matlab Grundkurs | Solution file to Exercise 01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% mandatory
clear; clc; close all;

%% load the LiBattery data
LiBattery = importdata('LiBatteryData.mat');
SalesRepot = importdata('CompanySalesData.mat');
Surf = importdata('SurfData.mat');

%% ============ Part 1: Plot battery data ============
h = figure('Name','matlabs basic plots');
plot(LiBattery.time,LiBattery.current_4C1,'o',...
    'MarkerEdgeColor',[0.0 0.3 0.5],...
    'MarkerSize',6);
hold on;
plot(LiBattery.time,LiBattery.current_2C1,'s',...
    'MarkerEdgeColor',[0.2 0.3 0.25],...
    'MarkerSize',6);
plot(LiBattery.time,LiBattery.current_C1,'x',...
    'MarkerEdgeColor',[0.5 0.7 0.1],...
    'MarkerSize',6);
hold off;
grid on;
title("characteristic line: discharging Li-Ion Battery " +...
    "(" + "temperature = " + num2str(LiBattery.temperature(1)) + LiBattery.units.temperature + ")");
xlabel(("time in " + LiBattery.units.time),'FontSize',14);
ylabel(("cuurent in " + LiBattery.units.current_1C1) ,'FontSize',14);
legend('LiBattery 4C_1','LiBattery 2C_1','LiBattery 1C_1','Fontsize',14);

%% ============ Part 2: Bar plot on company sales data ============
g = figure('Name','sales report');
% vertical 
subplot(1,2,1);
hold on
bar(SalesRepot.year,SalesRepot.turnover,0.5,'FaceColor','blue');
bar(SalesRepot.year,SalesRepot.costs,0.35,'FaceColor','red');
bar(SalesRepot.year,SalesRepot.profit,0.2,'FaceColor','green');
grid on
ylabel("mio. " + SalesRepot.units.turnover,'FontSize',14);
xlabel('year','FontSize',14)
set(gca,'xtick',2020:2024)
legend({'turnover','costs','profit'},...
    'Location','northeast','FontSize',14)
title('company sales vertical','FontSize',14);
% horizontal
subplot(1,2,2);
hold on;
barh(SalesRepot.year,SalesRepot.turnover,0.5,'FaceColor','blue');
barh(SalesRepot.year,SalesRepot.costs,0.35,'FaceColor','red');
barh(SalesRepot.year,SalesRepot.profit,0.2,'FaceColor','green');
grid on;
xlabel("mio. " + SalesRepot.units.turnover,'FontSize',14);
ylabel('year','FontSize',14)
set(gca,'ytick',2020:2024)
legend({'turnover','costs','profit'},...
    'Location','northwest','FontSize',14)
title('company sales horizontal','FontSize',14);

%% ============ Part 3: Plot surf data ============
f = figure('Name','3D Surf plot');
ax1 = axes('Parent',f,'Units','normalized','Position',[.15 .15 .75 .75]);
surf(ax1,Surf.X,Surf.Y,Surf.Z,'FaceAlpha',0.5);
xlabel(Surf.units.x,'FontSize',14);
ylabel(Surf.units.y,'FontSize',14);
zlabel(Surf.units.z,'FontSize',14);
title('Two surf plots','FontSize',14);
ax2 = axes('Parent',f,'Units','normalized','Position',[.75 .75 .2 .2]);
surf(ax2,Surf.X,Surf.Y,Surf.Z,'FaceAlpha',0.5);
view(ax2,0,90)

