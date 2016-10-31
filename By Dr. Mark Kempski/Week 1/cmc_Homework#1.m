%Clair Cunningham     Numerical Methods     3/7/2013     Homework #1

%% The driven van der Pol Oscillator
% Evaluates the van der Pol Oscillator equation using the Forward Euler Approach

% Reset variables, close windows, and clear command window.
clear all; close all; clc;

% Initialize Constants and Variables
i = 1;
t = (0:.03:30);
dt = t(2)-t(1);
x(i) = -3; %Starting Position
v(i) = 0; %Starting Velocity
a(i) = 0; %Initliaze Acceleration variable

%Set f(t) all equation values for the limited time.
f_t = -20.*exp(-t./5).*sin(5.*t);

%Run a "for loop" with 1000 intervals since first interval is done
for i = 1:1000
 a(i) = -(x(i)^2-1)*v(i)-x(i)+f_t(i);
 v(i+1) = v(i)+a(i)*dt;
 x(i+1) = x(i)+v(i+1)*dt;
end  

%Add the last value of the acceleration to the array
a(i+1) = -(x(i)^2-1)*v(i)-x(i)+f_t(i);
%Graph the representation of the data.
figure(1);
plot(t,x,t,v)
grid on;
title('Driven van der Pol Oscillator');
xlabel('time (sec)');
ylabel('displacement (ft)');
legend('x','v');