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
%opts = odeset('RelTol',1e-6,'AbsTol',1e-8);
opts = odeset('RelTol',1e-6,'AbsTol',1e-8,'OutputFcn',@myOutputFcn);
tic
[t, y] = ode45(@MassSpringDamperSystem, tSpan, y0, opts);
time = toc;

%% show results
figure('Name','results ode45')
subplot(1,2,1);
plot(y(:,1),t,'k-o','MarkerSize',5);
hold on; 
plot(y(:,2),t,'b-x','MarkerSize',2);
grid on;
legend({'position','speed'});
set(gca,'xdir','reverse');
xlabel('pos. in m, speed in m/s');
ylabel('time in s');

subplot(1,2,2);
semilogx([0; diff(t)],t,'-o');
grid on;
xlabel('Integration step');
legend('stepsize')
title(['ode45',' | TimeSteps: ',num2str(length(t))]);
