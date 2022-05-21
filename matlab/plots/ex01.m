%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%// Abstract:   Script to visualize matlabs basic plots
%// Autor:      Jannik Wiessler
%// Date:       Dec, 2020
%// Version:    1.0
%// Note:       Matlab Grundkurs | Exercise 01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% mandatory
clear; clc; close all;

%% load the LiBattery data
LiBattery = importdata('LiBatteryData.mat');
SalesRepot = importdata('CompanySalesData.mat');
Surf = importdata('SurfData.mat');

%% ============ Part 1: Plot battery data ============
h = figure('Name','matlabs basic plots');

% -------------- %
% your code here %
% -------------- %

%% ============ Part 2: Plot company sales data ============
g = figure('Name','sales report');
% vertical 
subplot(1,2,1);

% -------------- %
% your code here %
% -------------- %

% horizontal
subplot(1,2,2);

% -------------- %
% your code here %
% -------------- %

%% ============ Part 3: Plot surf data ============
f = figure('Name','3D Contour plot');

% -------------- %
% your code here %
% -------------- %

