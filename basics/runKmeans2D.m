%% script to run k-means
clear; clc; close all;

%% specify data and kMean parameters

data2load = 'data_structured';
showDistributionInit = true;
numOfCenters = 3;
maxIters = 30;

%% load data
if strcmp(data2load,'data_structured')
    data = load('data_structured.txt');
    xParameter = 'xDim';
    yParameter = 'yDim';
elseif strcmp(data2load,'data_random')
    data = load('data_random.txt');
    xParameter = 'xDim';
    yParameter = 'yDim';
elseif strcmp(data2load,'Mall_Customers')
    temp = readtable('Mall_Customers.csv');
    xParameter = 'AnnualIncome_k__';
    yParameter = 'SpendingScore_1_100_';
    data = zeros(size(temp,1),2);
    data(:,1) = temp.(xParameter);
    data(:,2) = temp.(yParameter);
    clear temp 
else
    error('invalid data');
end

%% show the data before performing kMeans
if showDistributionInit
    plot(data(:,1),data(:,2),'ko');
    grid on;
    title('Data distribution')
    xlabel(xParameter,'Interpreter','None');
    ylabel(yParameter,'Interpreter','None');
    disp(" >> press return to continue ...")
    pause;
    close(gcf)
end

%% run Kmeans
[clusterIDX, center] = kMeans2D( numOfCenters, data , maxIters );

%% matlabs internal kMeans algorithm (requires statistics_toolbox)
[clusterIDX_matlab, center_matlab] = kmeans( data, numOfCenters);
