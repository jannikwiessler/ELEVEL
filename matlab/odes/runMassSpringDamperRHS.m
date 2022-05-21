clear; close all; clc;

tStart = 0;
tEnd = 30;
tspan = [tStart tEnd];

x0 = 1;
v0 = 0;
y0 = [x0;v0];


[t,y] = ode45(@MassSpringDamperRHS, tspan, y0);


figure('Name','results ode45');
subplot(2,1,1)
plot(t, y(:,1),'k-o','MarkerSize',5);
ylabel('Position')
grid on;
subplot(2,1,2)
plot(t, y(:,2),'b-x','MarkerSize',5);
ylabel('Speed');
grid on;
xlabel('sim time in [s]');