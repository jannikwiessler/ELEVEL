function dydt = MassSpringDamperRHS(t,y)

x = y(1);
v = y(2);

c = 1;
d = 1;
m = 1;

dvdt = -(d/m * v + c/m * x);
dxdt = v;

dydt(1,1) = dxdt;
dydt(2,1) = dvdt;
end