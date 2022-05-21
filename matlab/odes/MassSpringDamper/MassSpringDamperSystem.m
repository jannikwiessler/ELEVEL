function dy = MassSpringDamperSystem(t,y)
%% get the locals 
x = y(1); % postion
v = y(2); % speed

%% define force
F = force(t);

%% define constants
c = 1;
d = 1;
m = 1;

%% do the ode system
dvdt = -(d/m*v+c/m*x+F/m);
dxdt = v;

%% return value
dy(1,1) = dxdt;
dy(2,1) = dvdt;
end