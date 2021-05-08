clear; close all; clc;

%% settings: sim time
tStart = 0;
tEnd = 30;
tSpan = [tStart tEnd];

%% settings: init values
x0 = 1;
v0 = 0;
y0 = [x0; v0];

%% settings: solver
solver = {'ode45','ode23','ode23s','ode15s'};
opts = odeset('RelTol',1e-6,'AbsTol',1e-8);

%% start sim 
h = figure('Name','Simulation results');

for i = 1:length(solver)
    tic
    switch solver{i}
        case 'ode45'
            [t, y] = ode45(@MassSpringDamperSystem, tSpan, y0, opts);
        case 'ode23'
            [t, y] = ode23(@MassSpringDamperSystem, tSpan, y0, opts);
        case 'ode23s'
            [t, y] = ode23s(@MassSpringDamperSystem, tSpan, y0, opts);
        case 'ode15s'
            [t, y] = ode15s(@MassSpringDamperSystem, tSpan, y0, opts);
    end
    time = toc;
    
    ax1 = subplot(1,2*length(solver),2*i-1);
    plot(y(:,1),t,'k-o','MarkerSize',5);
    hold on; 
    plot(y(:,2),t,'b-x','MarkerSize',2);
    grid on;
    legend({'position','speed'});
    set(gca,'xdir','reverse');
    xlabel('pos. in m, speed in m/s');
    ylabel('time in s');
    title([solver{i},' | Time: ',num2str(time)])
    
    ax2 = subplot(1,2*length(solver),2*i);
    semilogx([0; diff(t)],t,'-o');
    grid on;
    xlabel('Integration step');
    legend('stepsize')
    title([solver{i},' | TimeSteps: ',num2str(length(t))]);
    
    linkaxes([ax1 ax2],'y');
end