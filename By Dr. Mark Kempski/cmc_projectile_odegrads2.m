function [t,data]=cmc_projectile_odegrads2()
% This program computes the integration of Projectile Motion equations
% Reset variables, close windows, and clear command window.
clear all; close all; clc;

% set up constants
vel0=147.;  % ft/sec = 100 mph *(88 ft/sec)/(60mph)
theta=30.;  % degrees relative to horizontal
velx0=cosd(theta)*vel0; %w1IC
vely0=sind(theta)*vel0; %w2IC
x0=0.; %w3IC
y0=0.; %w4IC
wICvector = [velx0;vely0;x0;y0];
tspan = [0 4];

%solve the ode problem
[t,data] = ode45(@wdoteqns, tspan, wICvector);
% Define data vectors
vx = data(:,1);
vy = data(:,2);
x = data(:,3);
y = data(:,4);
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

figure(3)
plot(vx,vy)
grid on
title('Projectile Velocity with Drag')
xlabel('vx (ft/sec)')
ylabel('vy (ft/sec)')
figure(4)
plot(t,vx,t,vy)
grid on
title('Projectile Velocity (with drag) Time History')
xlabel('time (sec)')
ylabel('velocity (ft/sec)')
legend('vx','vy')
end

function [wdotvector] = wdoteqns(t,w)
g=32.2;
CdC_m=0.001731;
% gradient equation definition
    wdot1 = -CdC_m*sqrt(w(1)^2+w(2)^2)*w(1); %vxgrad
    wdot2 = -CdC_m*sqrt(w(1)^2+w(2)^2)*w(2)-g; %vygrad
    wdot3 = w(1); %xgrad
    wdot4 = w(2); %ygrad
    wdotvector = [wdot1;wdot2;wdot3;wdot4];
end
