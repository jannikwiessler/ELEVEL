function [ clusterIDX, center ] = kMeans2D( numOfCenters, data , maxIter )
%kMeans2D - rough implementation of kmeans algorithm
%this a done in the matlab seminar on elevel (january 2021)
%
% Syntax:  [clusterIDX, center] = kMeans2D(numOfCenter, data, maxIter)
%
% Inputs:
%    numOfCenter - number of center the algorithm use to find clusters
%    data - data on which the clusteranalysis is performed
%    maxIter - maximum of iterations
%
% Outputs:
%    clusterIDX - vector containing cluster index for each sample
%    center - final centers
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% Author: Jannik Wiessler
% January 2021; Last revision: 31-Jan-2021
%
% ------------- BEGIN CODE --------------
%% define colors
colors = {'m';'c';'r';'g';'b';'y'};

if numOfCenters > length(colors) || numOfCenters < 1
    error('invalid numOfCenters needs to be < 7');
end

numOfDataPoints = size(data,1); % number of points

%% Choose k data points as initial centroids

% choose numOfCenters unique random indices between 1 and size(P,2) (number of points)
randIdx = randperm(numOfDataPoints,numOfCenters);

% initial centroids
center = data(randIdx,:);

%% do the init stuff

% init cluster array
clusterIDX = zeros(numOfDataPoints,1);

% init previous cluster array clusterPrev (for stopping criterion)
centerPrev = center; % previous center

% for reference: count the iterations
iterations = 0;

% init stopping criterion
runFlag = true; % if stopping criterion met, it changes to true

% open figure
figure('Name','kMeans');
plot(data(:,1), data(:,2),'ko');
hold on;
for idxCenter = 1:numOfCenters
   
    plot(center(idxCenter,1),center(idxCenter,2),...
        's','MarkerSize',12,...
        'MarkerFaceColor',colors{idxCenter},...
        'MarkerEdgeColor',[0.1 0.1 0.1]);
    
end
grid on;
xlim([min(data(:,1)) max(data(:,1))]);
ylim([min(data(:,2)) max(data(:,2))]);
pause(1)

%% kmeans: repeat until stopping criteria is reached
while runFlag
    
    dist = zeros(numOfDataPoints,numOfCenters); % init dist mat
    
    for idxCenter = 1:numOfCenters % calc dist (L2)
        
       temp = data - center(idxCenter,:); % x und y Abstand berechnen
       
       dist(:,idxCenter) = sqrt(sum(temp.^2,2)); % calc dist
       
    end
       
    [~,clusterIDX] = min(dist,[],2);         
    
    for idxCenter = 1:numOfCenters % calc new centers
    
        center(idxCenter,:) = mean(data(clusterIDX == idxCenter,:)); % mean of clusters
        
    end
    
    if all(center == centerPrev,'all') || iterations >= maxIter % abort if center are not moving anymore
       runFlag = false; 
    end
        
    cla; % clear all datapoint in current figure

    hold on;
    
    for idxCenter = 1:numOfCenters % plot new colors wrt clusters
    
        plot(data(clusterIDX==idxCenter,1),data(clusterIDX==idxCenter,2),...
            [colors{idxCenter},'o']);
        
    end
             
    for idxCenter = 1:numOfCenters % plot old and mew centers
            
        plot([centerPrev(idxCenter,1) center(idxCenter,1)],[centerPrev(idxCenter,2) center(idxCenter,2)],...
        ['-',colors{idxCenter},'s'],'MarkerSize',12,...
        'LineWidth',2,...
        'MarkerFaceColor',colors{idxCenter},...
        'MarkerEdgeColor',[0.1 0.1 0.1]);
        
    end
    
    centerPrev = center;
    
    pause(0.5)
    
    iterations = iterations + 1;
    
end


% for reference: print number of iterations
fprintf('kMeans used %d iterations of changing centroids.\n',iterations);
end
