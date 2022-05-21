 function stop = myOutputFcn(t,y,FLAG)
persistent myPlot
if strcmp(FLAG,'init')
    myPlot = figure('Name','MSD System');
    plot(y(1),t(1),'k-o');
    hold on;
    plot(y(2),t(1),'b-x');
    ylim(t);
    set(gca,'xdir','reverse');
    grid on;
    xlabel('position in m, speed in m/s');
    ylabel('time in s');
    legend({'poistion','speed'});
elseif strcmp(FLAG,'')
    time = get(myPlot.Children(2).Children(1),'ydata'); % time
    position = get(myPlot.Children(2).Children(2),'xdata'); % postion
    speed = get(myPlot.Children(2).Children(1),'xdata'); % speed
    set(myPlot.Children(2).Children(2),'xdata',[position y(1,:)],'ydata',[time t]); % postion
    set(myPlot.Children(2).Children(1),'xdata',[speed y(2,:)],'ydata',[time t]); % speed
    pause(0.05);
end
if strcmp(FLAG,'done')
    stop = 1;
else
    stop = 0;
end
end