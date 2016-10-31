% this program computes the integration of Projectile Motion equations
% as developed by MH Kempski dated: 06-March-2013
%
clear
clc
%
% set up constnts
%
g=32.2;
delta_t=0.1;
CdC_m=0.001731;
x0=0.;
y0=0.;
vel0=147.;  % ft/sec = 100 mph *(88 ft/sec)/(60mph)
theta=30.;  % degrees relative to horizontal
velx0=cosd(theta)*vel0;
vely0=sind(theta)*vel0;
% initiate forward Euler integration scheme
i=1;
t(i)=0;
x(i)=x0;
y(i)=y0;
vx(i)=velx0;
vy(i)=vely0;
% iterate solution
%
% need code here ...
%
%
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