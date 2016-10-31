% Clair Cunningham	Numerical Methods	Midterm Part 2
% Mechanical System
% Reset variables, close windows, and clear command window.
clear all; close all; clc;

%set up constants
dt = 0.1;
tmax = 30;
t = 0:0.1:tmax;
tcount = 0;
M = 20;
K1 = 2;
K2 = 5;
B1 = 0.1;
B2 = 8;
x0 = 0.4;
y0 = 0.4;
vx0 = 0;
Fx=0;

% initiate forward Euler integration scheme
i = 1; n = 1;
x(i) = x0;
y(i) = y0;
v(i) = vx0;
vgrad(i) = 0;
ygrad(i) = 0;
farray(i) = Fx;

while tcount<=tmax
    if v(i)>=0 %checks for negative velocity and how to set the force
        Fapplied = 0;
    else
        Fapplied = Fx;
    end
	vgrad(i) = (-(K1+K2)*x(i)+K1*y(i)-B1*v(i))/M;
	ygrad(i) = (4/B2)*(K1*x(i)-K1*y(i)+Fapplied);
	v(i+1) = v(i) + vgrad(i)*dt;
	x(i+1) = x(i) + v(i)*dt;
	y(i+1) = y(i) + ygrad(i)*dt;
    i = i + 1; %while loop counter
    tcount = tcount + 0.1; %time step = 0.1;
    if x(i)<0  %Reset Process and Increase Applied Constant Force
        farray(n) = Fx; %stores change in force in an array
        Fx = Fx+0.01;
        i = 1;
        tcount = 0;  
        n = n+1; %for loop counter
    end    
end
farray(n) = Fx;
%Plot Positions of Mechanical System Components
figure(1)
plot(t,x,t,y)
grid on
title('System Motion with No Applied Force')
xlabel('Time t')
ylabel('Position x(t) & y(t)')
legend('x','y')

