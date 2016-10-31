%Clair Cunningham   Numerical Methods   Midterm
% This program computes the integration of Projectile Motion equations
% Reset variables, close windows, and clear command window.
clear all; close all; clc;

% set up constants
g=32.2; %ft/sec^2
delta_t=0.01;
density = 0.00237; %slug/ft^3
Cd = 0.3; %coefficient of drag
BallD = 2.9/12; %feet
mass = 0.00994; %slugs
area = pi*(BallD/2)^2;%ft^2
CdC_m = ((1/2)*density*area*Cd)/mass;

x0=0.;
y0=0.;
vel0=147.;  % ft/sec = 100 mph *(88 ft/sec)/(60mph)
theta=60.;  % degrees relative to vertical
wind = 20*(5280/3600); %approximately 20 mph %tail or head wind max +/-44feet/sec
velx0=sind(theta)*vel0;
vely0=cosd(theta)*vel0;

% initiate forward Euler integration scheme
i=1;
t(i)=0;
x(i)=x0;
y(i)=y0;
vx(i)=velx0;
vy(i)=vely0;
vxgrad(i) = 0;
vygrad(i) = 0;

% iterate solution
while y(i) >= y0    
    vxgrad(i) = -CdC_m*sqrt(vx(i)^2+vy(i)^2)*vx(i);
    vygrad(i) = -CdC_m*sqrt(vx(i)^2+vy(i)^2)*vy(i)-g;
    vx(i+1) = vx(i) + vxgrad(i)*delta_t;
    vy(i+1) = vy(i) + vygrad(i)*delta_t;
    x(i+1) = x(i) + vx(i)*delta_t+wind*delta_t;
    y(i+1) = y(i) + vy(i)*delta_t;
    t(i+1) = t(i) + delta_t;
    i = i+1;
    
end

% plot trajectory and time course results
figure(1)
plot(x,y)
grid on
title('Projectile Trajectory with Drag')
xlabel('x (ft)')
ylabel('y (ft)')
figure(2)
plot(t,x,t,y)
grid on
title('Projectile (with drag) Time History')
xlabel('time (sec)')
ylabel('displacement (ft)')
legend('x','y')
